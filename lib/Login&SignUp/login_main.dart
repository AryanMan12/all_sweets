import 'dart:developer';

import 'package:all_sweets/Login&SignUp/sign_up.dart';
import 'package:all_sweets/Owner/owner_main.dart';
import 'package:all_sweets/RegularWorkers/regular_main.dart';
import 'package:all_sweets/TemporaryWorkers/temporary_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Customer/customer_main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  String type = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone_android,
                size: 100,
              ),
              SizedBox(height: 75),

              //hello
              Text(
                'All Sweets',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sweetness, Made In India',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 35),

              //username
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone number, email or username',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //log in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InkWell(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),

              //forgotten password
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Want to create an Account?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SignUpPage()))),
                    child: Text(
                      ' Sign Up Here!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ));
  }

  Future signIn() async {
    String _email = emailController.text.trim();
    String _password = passwordController.text.trim();
    bool isAvail = await checkIfDocExists(_email);

    if (!isAvail) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email Doesn't Exsists")));
    } else {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((value) {
        fetchAllContact(_email).then((value) {
          setState(() {
            type = value;
          });
        });
        if (type == "customer") {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => CustomerBottomNav())));
        } else if (type == "owner") {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => OwnerBottomNav())));
        } else if (type == "worker") {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => RegularWorker())));
        } else if (type == "tempworker") {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => TempWorker())));
        }
      });
    }
  }

  Future<String> fetchAllContact(email) async {
    String type = "";
    Map<String, dynamic> doc;
    DocumentSnapshot documentSnapshot = await users.doc(email).get();
    doc = documentSnapshot.data() as Map<String, dynamic>;
    type = doc.values.first;
    return type;
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await users.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }
}
