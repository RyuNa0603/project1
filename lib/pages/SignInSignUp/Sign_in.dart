import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/pages/SignInSignUp/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back 👋",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: ColorsApp.greyscale900),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Sign to your account",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: ColorsApp.greyscale500),
            ),
            SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                style: TextStyle(
                  color: ColorsApp.greyscale900,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: "Your password",
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: ColorsApp.primary500,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.primary500,
                minimumSize: Size(327, 48),
                padding:
                    const EdgeInsets.symmetric(horizontal: 134.5, vertical: 12),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  color: ColorsApp.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            RichText(
              text: TextSpan(
                text: "Don't have an account?",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorsApp.greyscale500,
                ),
                children: [
                  TextSpan(
                    text: " Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorsApp.primary500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                    endIndent: 10,
                  ),
                ),
                Text(
                  "Or with",
                  style: TextStyle(
                    color: ColorsApp.greyscale500,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: Size(327, 48),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Text(
                "Sign in with Google",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: ColorsApp.greyscale900,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: Size(327, 48),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Text(
                "Sign in with Apple",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: ColorsApp.greyscale900,
                ),
              ),
            ),

            // Row(
            //   children: [
            //     const Text("Don't have any account?"),
            //     InkWell(
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const Signup()),
            //   );
            // },
            //       child: const Text(
            //         "Sign up",
            //         style: TextStyle(color: Colors.blue),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => Signup(),
      //       ),
      //       (route) => false,
      //     );
      //   },
      // ),
    );
  }
}
