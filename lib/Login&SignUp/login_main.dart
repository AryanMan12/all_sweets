import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.phone_android,
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
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle
                  (color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
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
                'Forgotten your login details?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' Get help with logging in.',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
      ],
      )),
    ));
  }
}
