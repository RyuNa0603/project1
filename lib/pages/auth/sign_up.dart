import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/pages/auth/sign_in.dart';
import 'package:project1/pages/auth/verification_code.dart';
import 'package:project1/repo/auth_repo.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  bool _isLengthValid = false;
  bool _hasNumber = false;
  bool _hasLetter = false;

  String data = "";
  String error = "";
  bool isLoading = false;

  Future<void> signUp(String email, String password) async {
    setState(() {
      data = "";
      error = "";
      isLoading = true;
    });
    try {
      final response = await AuthRepo().signUp(email, password);
      data = response;
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _validatePassword(String password) {
    setState(() {
      _isLengthValid = password.length >= 8;
      _hasNumber = RegExp(r'[0-9]').hasMatch(password);
      _hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    });
  }

  Widget _buildValidationRow(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          color: isValid ? Colors.green : Colors.red,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? ColorsApp.greyscale900 : Colors.red,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: ColorsApp.greyscale900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Create account and choose favorite menu",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: ColorsApp.greyscale500,
                ),
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  hintText: "Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  hintText: "Your Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _passwordController,
                onChanged: _validatePassword,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  hintText: "Your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: ColorsApp.greyscale500,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildValidationRow("Minimum 8 characters", _isLengthValid),
              _buildValidationRow("Atleast 1 number (1-9)", _hasNumber),
              _buildValidationRow(
                  "Atleast lowercase or uppercase letters", _hasLetter),
              const SizedBox(height: 24),
              BlocConsumer(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: (_isLengthValid && _hasNumber && _hasLetter)
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VerificationEmail()),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.primary500,
                        minimumSize: const Size(327, 48),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: "Have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorsApp.greyscale500,
                    ),
                    children: [
                      TextSpan(
                        text: " Sign In",
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
              ),
              SizedBox(
                height: 46,
              ),
              Text(
                "By clicking Register, you agree to our ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorsApp.greyscale500,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Terms, Data Policy.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorsApp.primary500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
