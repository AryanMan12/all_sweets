import 'package:flutter/material.dart';
import 'Login&SignUp/login_main.dart';
import 'SplashScreen.dart';
//import 'Login&SignUp/sign_up.dart';
import 'package:all_sweets/Customer/sidenavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
