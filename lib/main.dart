import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/pages/cart/confirm_order.dart';
import 'package:project1/pages/cart/location.dart';
import 'package:project1/pages/order_status/order_status.dart';
import 'package:project1/settings/notification.dart';
import 'package:project1/settings/settings.dart';

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
      home:Notifications(),
      // BlocProvider(
      //   create: (_) => AuthCubit(),
      //   child: SuccessVerificationPage(),
      // ),
    );
  }
}
