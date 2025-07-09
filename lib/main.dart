import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/cubit/auth_cubit.dart';   
import 'package:project1/cubit/category_cubit.dart';
import 'package:project1/cubit/v_c_cubit.dart';    
import 'package:project1/cubit/vendors_cubit.dart';
import 'package:project1/lesson/page/home_page.dart';
import 'package:project1/pages/auth/sign_in.dart';   
import 'package:project1/pages/auth/sign_up.dart';
import 'package:project1/pages/auth/verification_code.dart';
import 'package:project1/pages/home/vendors.dart';

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

      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoryCubit()),
          BlocProvider(create: (context) => VendorsCubit()),
          BlocProvider(create: (context) => VCCubit()),
        ],
        child: const HomePage(),
      ),
    );
  }
}

