import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/cubit/auth_cubit.dart';
import 'package:project1/pages/auth/sign_in.dart';
import 'package:project1/pages/auth/sign_up.dart';
import 'package:project1/pages/auth/verification_code.dart';

void main() {
  runApp(
    const MyApp(),
  );
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
      home: BlocProvider(
        create: (_) => AuthCubit(),
        child: SignUpPage(),
      ),
    );
  }
}
