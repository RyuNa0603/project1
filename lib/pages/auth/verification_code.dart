import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/pages/auth/success_verification_page.dart';

class VerificationEmail extends StatefulWidget {
  const VerificationEmail({super.key});

  @override
  State<VerificationEmail> createState() => _VerificationEmailState();
}

class _VerificationEmailState extends State<VerificationEmail> {
  List<String> otp = ['', '', '', ''];

  void addDigit(String digit) {
    for (int i = 0; i < otp.length; i++) {
      if (otp[i] == '') {
        setState(() {
          otp[i] = digit;
        });
        break;
      }
    }
  }

  void removeDigit() {
    for (int i = otp.length - 1; i >= 0; i--) {
      if (otp[i] != '') {
        setState(() {
          otp[i] = '';
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Verification Email",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please enter the code we just sent to email",
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              "Johndoe@gmail.com",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  height: 60,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsApp.primary500,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    otp[index],
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text("If you didn’t receive a code? Resend"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (otp.every((e) => e != '')) {
                  print("Entered OTP: ${otp.join()}");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter all 4 digits")),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessVerificationPage(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.primary500,
                minimumSize: const Size(320, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Continue",
                style: TextStyle(color: ColorsApp.white),
              ),
            ),
            const Spacer(),
            buildNumberPad(),
          ],
        ),
      ),
    );
  }

  Widget buildNumberPad() {
    final keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['.', '0', '<']
    ];
    return Container(
      color: ColorsApp.primary500,
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: Column(
        children: keys.map(
          (row) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row.map(
                (key) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(40),
                        onTap: () {
                          if (key == '<') {
                            removeDigit();
                          } else if (RegExp(r'^[0-9]$').hasMatch(key)) {
                            addDigit(key);
                          }
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorsApp.primary500,
                          ),
                          child: key == '<'
                              ? Icon(
                                  Icons.backspace_outlined,
                                  color: ColorsApp.white,
                                )
                              : Text(
                                  key,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsApp.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          },
        ).toList(),
      ),
    );
  }
}
