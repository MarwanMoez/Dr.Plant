import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PestsPage extends StatefulWidget {
  @override
  _PestsPageState createState() => _PestsPageState();
}

class _PestsPageState extends State<PestsPage>{
  File? _image;
  Map<String, dynamic>? _result;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _classifyImage(_image!);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _classifyImage(File image) async {
    final request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.3:5000/pests'));
    request.files.add(await http.MultipartFile.fromPath('file', image.path));
    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      setState(() {
        _result = jsonDecode(responseData);
      });
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pest Detector',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: Color.fromARGB(255, 6, 104, 57),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image == null ? Text('No image selected.') : Image.file(_image!),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: _pickImage,style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO( 6, 104, 57, 1)),
                child: Text('Pick Image',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
              ),
              SizedBox(height: 20),
              _result == null
                  ? Container()
                  : Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 6, 104, 57),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Text('Class:', style: TextStyle(fontWeight: FontWeight.bold)),
                              // SizedBox(height: 5),
                              Text('${_result!['class']}',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 6, 104, 57),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(66, 255, 255, 255),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Suggestion :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                              SizedBox(height: 5),
                              Text('You Need to Contact your local pest control professional', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
