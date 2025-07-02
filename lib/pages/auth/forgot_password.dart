
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/cubit/auth_cubit.dart';
import 'package:project1/cubit/auth_state.dart';
import 'package:project1/pages/auth/sign_in.dart';
import 'package:pinput/pinput.dart';

class ForgotPassword extends StatefulWidget {
  final String email;
  const ForgotPassword({super.key, required this.email});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
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
            Text(
              "Verification Email",
              style: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Please enter the code we just sent to email",
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: ColorsApp.greyscale500,
              ),
            ),
            Text(
              widget.email,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorsApp.greyscale900,
              ),
            ),
            const SizedBox(height: 30),
            Pinput(
              controller: _codeController,
              length: 4,
              enabled: false,
              defaultPinTheme: PinTheme(
                width: 52,
                height: 52,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorsApp.primary500, width: 2),
                ),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (state is AuthSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state is AuthLoading
                      ? null
                      : () {
                          if (_codeController.text.length == 4) {
                            context.read<AuthCubit>().verify(
                                  widget.email,
                                  _codeController.text,
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter all 4 digits"),
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
                  child: state is AuthLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Continue",
                          style: TextStyle(color: ColorsApp.white),
                        ),
                );
              },
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
        children: keys.map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row.map((key) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      if (key == '<') {
                        if (_codeController.text.isNotEmpty) {
                          setState(() {
                            _codeController.text = _codeController.text
                                .substring(0, _codeController.text.length - 1);
                          });
                        }
                      } else if (RegExp(r'^[0-9]$').hasMatch(key)) {
                        if (_codeController.text.length < 4) {
                          setState(() {
                            _codeController.text += key;
                          });
                        }
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
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
