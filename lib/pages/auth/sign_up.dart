// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project1/core/colors_app.dart';
// import 'package:project1/cubit/auth_cubit.dart';
// import 'package:project1/cubit/auth_state.dart';
// import 'package:project1/pages/auth/sign_in.dart';
// import 'package:project1/pages/auth/verification_code.dart';
// import 'package:project1/repo/auth_repo.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   bool _isObscure = true;

//   bool _isLengthValid = false;
//   bool _hasNumber = false;
//   bool _hasLetter = false;

//   String data = "";
//   String error = "";
//   bool isLoading = false;

//   // Future<void> signUp(String email, String password, String name) async {
//   //   setState(() {
//   //     data = "";
//   //     error = "";
//   //     isLoading = true;
//   //   });
//   //   try {
//   //     final response = await AuthRepo().signUp(email, password, name);
//   //     data = response;
//   //   } catch (e) {
//   //     error = e.toString();
//   //   } finally {
//   //     setState(() {
//   //       isLoading = false;
//   //     });
//   //   }
//   // }

//   void _validatePassword(String password) {
//     setState(() {
//       _isLengthValid = password.length >= 8;
//       _hasNumber = RegExp(r'[0-9]').hasMatch(password);
//       _hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
//     });
//   }

//   Widget _buildValidationRow(String text, bool isValid) {
//     return Row(
//       children: [
//         Icon(
//           isValid ? Icons.check_circle : Icons.cancel,
//           color: isValid ? Colors.green : Colors.red,
//           size: 18,
//         ),
//         const SizedBox(width: 8),
//         Text(
//           text,
//           style: TextStyle(
//             color: isValid ? ColorsApp.greyscale900 : Colors.red,
//             fontSize: 13,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 48),
//               Text(
//                 "Sign Up",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 24,
//                   color: ColorsApp.greyscale900,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 "Create account and choose favorite menu",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16,
//                   color: ColorsApp.greyscale500,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Name",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   hintText: "Your Name",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Email",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   hintText: "Your Email",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Password",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               TextField(
//                 controller: _passwordController,
//                 onChanged: _validatePassword,
//                 obscureText: _isObscure,
//                 decoration: InputDecoration(
//                   hintText: "Your password",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: BorderSide.none,
//                   ),
//                   fillColor: ColorsApp.greyscale500,
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _isObscure ? Icons.visibility_off : Icons.visibility,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure = !_isObscure;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               _buildValidationRow("Minimum 8 characters", _isLengthValid),
//               _buildValidationRow("Atleast 1 number (1-9)", _hasNumber),
//               _buildValidationRow(
//                   "Atleast lowercase or uppercase letters", _hasLetter),
//               const SizedBox(height: 24),
//               BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
//                 if (state is AuthSuccess) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const VerificationEmail(email: '',)),
//                   );
//                 } else if (state is AuthError) {
//                   print("Error:${state.message}");
//                 }
//               }, builder: (context, state) {
//                 return ElevatedButton(
//                   onPressed: (_isLengthValid && _hasNumber && _hasLetter)
//                       ? () {
//                           context.read<AuthCubit>().signUp(
//                                 _emailController.text,
//                                 _passwordController.text,
//                                 _nameController.text,
//                               );
//                         }
//                       : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: ColorsApp.primary500,
//                     minimumSize: const Size(327, 48),
//                   ),
//                   child: Text(
//                     state is AuthLoading ? "Loading " : "Register",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 16,
//                     ),
//                   ),
//                 );
//               }),
//               const SizedBox(height: 24),
//               Align(
//                 alignment: Alignment.center,
//                 child: RichText(
//                   text: TextSpan(
//                     text: "Have an account?",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                       color: ColorsApp.greyscale500,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: " Sign In",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 16,
//                           color: ColorsApp.primary500,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const SignUp()),
//                             );
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 46,
//               ),
//               Text(
//                 "By clicking Register, you agree to our ",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                   color: ColorsApp.greyscale500,
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const SignIn()),
//                   );
//                 },
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Terms, Data Policy.",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                       color: ColorsApp.primary500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/cubit/auth_cubit.dart';
import 'package:project1/cubit/auth_cubit.dart';
import 'package:project1/cubit/auth_state.dart';
import 'package:project1/functions/app_snack_bar.dart';
import 'package:project1/functions/primary_button.dart';
import 'package:project1/pages/auth/verification_code.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool hasMinLength(String password) => password.length >= 8;
  bool hasNumber(String password) => RegExp(r'\d').hasMatch(password);
  bool hasLetter(String password) => RegExp(r'[A-Za-z]').hasMatch(password);
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.openSans(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.greyscale900,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Create account and choose favorite menu',
                style: TextStyle(
                  fontSize: 16.0,
                  color: ColorsApp.greyscale500,
                ),
              ),
              const SizedBox(height: 24.0),
              AppTextFieldWithTitle(
                title: 'Name',
                controller: _nameController,
                hintText: 'Your name',
                validator: (value) {
                  if (value!.length < 3) {
                    return "Please enter a valid name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              AppTextFieldWithTitle(
                title: 'Email',
                controller: _emailController,
                hintText: 'Your email',
                validator: (value) {
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value!)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              AppTextFieldWithTitle(
                title: 'Password',
                controller: _passwordController,
                hintText: 'Your password',
                isPassword: true,
              ),
              const SizedBox(height: 16.0),
              _PasswordChecker(
                isPressed: isPressed,
                isCorrect: hasMinLength(_passwordController.text),
                message: 'Minimum 8 characters',
              ),
              _PasswordChecker(
                isPressed: isPressed,
                isCorrect: hasNumber(_passwordController.text),
                message: 'Atleast 1 number (1-9)',
              ),
              _PasswordChecker(
                isPressed: isPressed,
                isCorrect: hasLetter(_passwordController.text),
                message: 'Atleast lowercase or uppercase letters',
              ),
              const SizedBox(height: 24.0),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => AuthCubit(),
                          child: VerificationEmail(
                            email: _emailController.text.trim(),
                          ),
                        ),
                      ),
                    );
                  } else if (state is AuthError) {
                    AppSnackBar.show(context, state.message);
                  }
                },
                builder: (context, state) {
                  return PrimaryButton(
                    title: state is AuthLoading ? 'Loading...' : 'Register',
                    radius: 48.0,
                    height: 48.0,
                    onPressed: state is AuthLoading
                        ? null
                        : () async {
                            setState(() {
                              isPressed = true;
                            });
                            if (_formKey.currentState!.validate() &&
                                hasLetter(_passwordController.text) &&
                                hasNumber(_passwordController.text) &&
                                hasMinLength(_passwordController.text)) {
                              context.read<AuthCubit>().signUp(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                    _nameController.text.trim(),
                                  );
                            }
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppTextFieldWithTitle extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;

  const AppTextFieldWithTitle({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            color: ColorsApp.greyscale900,
          ),
        ),
        const SizedBox(height: 6.0),
        AppTextField(
          controller: controller,
          isPassword: isPassword,
          hintText: hintText,
          validator: validator,
        ),
      ],
    );
  }
}

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.roboto(
          fontSize: 16.0,
          color: const Color(0xFFB8B8B8),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: ColorsApp.primary500),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: SvgPicture.asset(obscure
                    ? 'assets/icons/eye.svg'
                    : 'assets/icons/eye-slash.svg'),
              )
            : null,
      ),
      obscureText: widget.isPassword && obscure,
      cursorHeight: 20.0,
      cursorColor: ColorsApp.primary500,
      style: GoogleFonts.roboto(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: ColorsApp.greyscale900,
      ),
      validator: widget.validator,
    );
  }
}

class _PasswordChecker extends StatelessWidget {
  final bool isPressed;
  final bool isCorrect;
  final String message;
  const _PasswordChecker(
      {required this.isPressed,
      required this.isCorrect,
      required this.message});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isPressed,
      child: Row(
        children: [
          isCorrect
              ? const Icon(Icons.check, color: Color(0xFFA28CE0))
              : const Icon(Icons.clear, color: Colors.red),
          Text(message),
        ],
      ),
    );
  }
}
