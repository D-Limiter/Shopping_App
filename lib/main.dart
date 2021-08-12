import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_1/Screens/LandingPage.dart';
void main() {
  
  runApp(LandingPage());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         textTheme: GoogleFonts.playfairDisplayTextTheme(),
          //Theme.of(context).textTheme,
  ),
  home: LandingPage(),
  );
  }
}