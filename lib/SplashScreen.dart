import 'dart:async';

import 'package:all_sweets/Customer/customer_main.dart';
import 'package:all_sweets/Login&SignUp/login_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Login&SignUp/sign_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return CustomerBottomNav();
                    } else {
                      return Login();
                    }
                  }),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 111, 74),
      body: Center(
        child: Lottie.network(
            'https://assets9.lottiefiles.com/packages/lf20_mn4rw3s4.json'),
      ),
    );
  }
}
