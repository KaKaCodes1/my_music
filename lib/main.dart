import 'package:flutter/material.dart';
// import 'package:my_music/screens/home_screen.dart';
// import 'package:my_music/screens/login_screen.dart';
import 'package:my_music/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Music',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 122, 161)),
        useMaterial3: true,
      ),
      
      home: const splashscreen(), //HomePage(), 
      
    );
  }
}

