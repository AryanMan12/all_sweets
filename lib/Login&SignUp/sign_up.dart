import 'package:flutter/material.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea (
        child : Center(
        child:Column(
          children: [
        //Welcome to All Sweets!
        Text(
          'Welcome To All Sweets',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            ),
        ),
        SizedBox(height:10),
           Text(
          'We Hope taste all the deliciousness',
          style: TextStyle(
            fontSize: 20,
            ),
        ),
        SizedBox(height:10),
        //Email 
TextField(
decoration: InputDecoration(),
),
        //Password

        //Sign-in

        //Not a member? Register Now!
      ],

      ), 
      ),
    ),
    );
    
  }
}
