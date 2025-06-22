import 'package:flutter/material.dart';
import 'package:project1/pages/home/author_profile_page.dart';
import 'package:project1/pages/home/authors_page.dart';
import 'package:project1/pages/home/home.dart';
import 'package:project1/pages/home/vendors.dart';
import 'package:project1/pages/onboarding/splash_screen.dart';
import 'package:project1/pages/onboarding/onboarding_page.dart';
import 'package:project1/pages/SignInSignUp/Sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      home: HomePage(),
    );
  }
}
