import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/pages/onboarding/onboaarding2.dart';

class OnboardingPage extends StatelessWidget {
   OnboardingPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Onboarding2(),
                ),
                );
              },
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: ColorsApp.primary500,
                  ),
                ),
              ),
            ),
            Image.network(
                "https://i.pinimg.com/736x/99/14/35/991435246b500bec06d895cd2da4bf1f.jpg"),
            Text(
              'Now reading books will be easier',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            Text(
              'Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFFA6A6A6)),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF54408C),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                fixedSize: const Size(200, 44),
              ),
              child: const Text("Continue"),
            ),
            const InkWell(
              child: Text(
                "Sign in",
                style: TextStyle(
                  color: Color(0xFF54408C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingModel {
  final String image;
  final String title;
  final String body;
  OnboardingModel({required this.image, required this.title, required this.body});
  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      image: json['createdAt'],
      title: json['name'],
      body: json['avatar'],
    );
  }
}
