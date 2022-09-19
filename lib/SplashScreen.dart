import 'dart:async';
import 'package:all_sweets/Customer/customer_main.dart';
import 'package:all_sweets/Login&SignUp/login_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Owner/owner_main.dart';
import 'RegularWorkers/regular_main.dart';
import 'TemporaryWorkers/temporary_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String type = "";

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        String email = FirebaseAuth.instance.currentUser?.email as String;
        fetchAllContact(email).then((type) {
          if (type == "customer") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => CustomerBottomNav()));
          } else if (type == "owner") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => OwnerBottomNav()));
          } else if (type == "worker") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegularWorker()));
          } else if (type == "tempworker") {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => TempWorker()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login()));
          }
        });
      }
    });
  }

  Future<String> fetchAllContact(email) async {
    String type = "";
    Map<String, dynamic> doc;
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection("Users").doc(email).get();
    doc = documentSnapshot.data() as Map<String, dynamic>;
    type = doc.values.first;
    return type;
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
