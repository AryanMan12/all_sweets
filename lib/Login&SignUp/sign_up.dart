import 'dart:developer';
import 'dart:ui';

import 'package:all_sweets/Customer/card_horizontal.dart';
import 'package:all_sweets/Customer/customer_main.dart';
import 'package:all_sweets/Login&SignUp/login_main.dart';
import 'package:all_sweets/Owner/order_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  CollectionReference customers =
      FirebaseFirestore.instance.collection("Customer");
  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bar_chart,
                    size: 100,
                  ),
                  SizedBox(height: 70),
                  //Welcome to All Sweets!
                  Text(
                    'Welcome To All Sweets',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We Hope you taste all the deliciousness',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30),

                  //Name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your name',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Phone
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your phone number',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Address
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your address',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //Confirm Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: cPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //Sign-up
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: signUp,
                        child: Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  //Not a member? Register Now!
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => Login()))),
                        child: Text(
                          ' Login Now!',
                          style: TextStyle(
                            color: Colors.deepPurple[500],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    String _name = nameController.text.trim();
    String _phone = phoneController.text.trim();
    String _address = addressController.text.trim();
    String _email = emailController.text.trim();
    String _password = passwordController.text.trim();
    String _cpassword = cPasswordController.text.trim();
    bool isAvail = await checkIfDocExists(_email);

    if (_name.isEmpty ||
        _phone.isEmpty ||
        _address.isEmpty ||
        _email.isEmpty ||
        _password.isEmpty ||
        _cpassword.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Text Fields Cannot be Empty")));
    } else if (_phone.length < 0 || _phone.length > 10) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter a Valid Phone Number")));
    } else if (_password != _cpassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password did not Match")));
    } else if (isAvail) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email Already Exsists")));
    } else {
      users.doc(_email).set({
        "email": _email,
        "type": "customer",
      });
      customers
          .doc(_email)
          .set({
            "email": _email,
            "name": _name,
            "phone": _phone,
            "address": _address
          })
          .then((value) => log("User Created"))
          .catchError((e) => log(e));
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: ((context) => CustomerBottomNav()))))
          .onError((error, stackTrace) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.toString()))));
    }
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
