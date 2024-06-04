// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_music/screens/login_screen.dart';


class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> 
  with SingleTickerProviderStateMixin{

  @override
  void initState(){
    super.initState();
    //This removes the top and bottom phone icons like the back buttons and the status bar on top
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    //how long the screen will be displayed before going to another page
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Login())
      );
    });
  }

    @override
  void dispose(){
    //This returns the icons
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 36, 131, 210), Colors.black, Color.fromARGB(255, 95, 153, 200)],
            begin:Alignment.topRight,
            end:Alignment.bottomLeft,
            ),
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 400,
            width: 400,
          ),
          const SizedBox(height: 10,),
          const Text(
            'My Music',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: 32,
            ),
          )
        ],
      ),
      ),
    );
  }
}

