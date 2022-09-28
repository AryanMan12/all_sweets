import 'package:flutter/material.dart';

class Feedback extends StatefulWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  State<Feedback> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text(
          'About Us',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              "Please Select the type of Feedback for helping us improve",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 25.0),
            // buildCheckItem("Trouble while Login?"),
            // buildCheckItem("Phone Number related changes"),
            //buildCheckItem("Personal Profile"),
            // buildCheckItem("Other Issues"),
            // buildCheckItem("Suggestions"),
          ],
        ),
      ),
    );
  }
}
