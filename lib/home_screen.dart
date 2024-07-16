import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gp_app/Pests_Screen.dart';
import 'package:gp_app/Soil_Screen.dart';
import 'package:gp_app/chat_screen.dart';
import 'package:flutter/material.dart';
// Import your destination pages
// import 'package:gp_app/Soil_Screen.dart';
import 'package:gp_app/Disease_Screen.dart';
// import 'package:gp_app/Pests_Screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 129, 227, 152),
            Color.fromARGB(255, 129, 227, 152),
          ], // Set your gradient colors here
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 104, 57),
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.menu,
          //     size: 40,
          //   ),
          // ),
          title: const Text(
            "DR.Plant",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Cera Pro",
                fontSize: 32,
                color: Color.fromARGB(255, 229, 229, 229)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 246, 246, 246),
                    child: Image.asset(
                      'assets/Logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: AnimatedTextKit(
                      displayFullTextOnTap: true,
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          "Hello, How may I assist you?",
                          speed: const Duration(milliseconds: 100),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                              fontFamily: "Cera Pro",
                              fontSize: 28,
                              color: Color.fromARGB(255, 6, 104, 57)),
                        )
                      ]),
                ),
                // const SizedBox(
                //   width: double.infinity,
                //   child: Text(
                //     "Here are some features",
                //     style: TextStyle(
                //         fontFamily: "Cera Pro",
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         color: Color.fromARGB(255, 29, 118, 21)),
                //   ),
                // ),
                const SizedBox(height: 50), // Added spacing
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(6, 104, 57, 1),
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                    textStyle: const TextStyle(
                      fontFamily: "Cera Pro",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ModelPage();
                    }));
                  },
                  child: const Text("Check for Disease",style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(6, 104, 57, 1),
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
                    textStyle: const TextStyle(
                      fontFamily: "Cera Pro",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PestsPage();
                    }));
                  },
                  child: const Text("Check for Pests",style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(6, 104, 57, 1),
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 34),
                    textStyle: const TextStyle(
                      fontFamily: "Cera Pro",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SoilPage();
                    }));
                  },
                  child: const Text("Check Soil Compatability",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChatScreen();
              }));
            },
            elevation: 10,
            backgroundColor: Color.fromARGB(255, 6, 104, 57),
            tooltip: "Chat with Broxi",
            child: Image.asset(
              "assets/GptGreen.png",
              width: 40,
            )),
      ),
    );
  }
}
