import 'package:flutter/material.dart';
import 'package:project1/pages/onboarding/onboarding3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Onboarding3(),
                  ),
                );
              },
              child: Align(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Color(0xFF54408C),
                  ),
                ),
              ),
            ),
            Image.network(
                "https://i.pinimg.com/736x/25/ec/b2/25ecb2b47a528a3f3bb4efc5998cd048.jpg"),
            Text(
              'Your Bookish Soulmate Awaits',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            Text(
              "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
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
