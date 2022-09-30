import 'dart:async';
import 'dart:io';
import 'package:all_sweets/Owner/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

class Faq_page extends StatefulWidget {
  const Faq_page({Key? key}) : super(key: key);

  @override
  State<Faq_page> createState() => _Faq_pageState();
}

class _Faq_pageState extends State<Faq_page> {
  double rating = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text(
          'Feedback And Support',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              "What is your issue? Would you like to give us a feedback?",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 25.0),
            buildCheckItem("Trouble while Login?"),
            buildCheckItem("Phone Number related changes"),
            buildCheckItem("Personal Profile"),
            buildCheckItem("Other Issues"),
            buildCheckItem("Suggestions"),
            SizedBox(height: 20.0),
            buildFeedbackForm(),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rating:$rating',
                      style: TextStyle(fontSize: 22, color: Colors.brown),
                    ),
                    const SizedBox(height: 25),
                    RatingBar.builder(
                      minRating: 1,
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.brown),
                      updateOnDrag: true,
                      allowHalfRating: false,
                      onRatingUpdate: (rating) => setState(() {
                        this.rating = rating;
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Spacer(),
            Row(
              children: <Widget>[
                Expanded(
                    child: FlatButton(
                  onPressed: () {},
                  color: Colors.brown,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 150.0,
      child: Stack(
        children: <Widget>[
          TextField(
            maxLines: 20,
            decoration: InputDecoration(
              hintText:
                  "Please leave your feedback and issues here, so we can help you out. ",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Colors.brown,
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 203, 184, 176)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildCheckItem(title) {
    return Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.check_circle, color: Colors.brown),
            SizedBox(width: 10),
            Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ))
          ],
        ));
  }
}
