import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/cubits_&_states/cubits/cart_cubit.dart';
import 'package:project1/cubits_&_states/cubits/category_cubit.dart';
import 'package:project1/cubits_&_states/cubits/v_c_cubit.dart';    
import 'package:project1/cubits_&_states/cubits/vendors_cubit.dart';
import 'package:project1/pages/cart/cart_page.dart';
import 'package:project1/pages/cart/cart_tab.dart';
import 'package:project1/pages/home/home.dart';

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
          BlocProvider(create: (context) => CartCubit()),
        ],
        child: const CartTab(),
      ),
    );
  }
}

