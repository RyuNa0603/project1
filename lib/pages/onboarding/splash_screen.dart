import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project1/core/colors_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primary500,
      body: Center(
        child: Container(
          child: Row(
            children: [SvgPicture.asset('assets/icons/splash.svg')],
          ),
        ),
      ),
    );
  }
}
