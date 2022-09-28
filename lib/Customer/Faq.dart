import 'dart:async';
import 'dart:io';
import 'package:all_sweets/Owner/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Faq_page extends StatefulWidget {
  const Faq_page({Key? key}) : super(key: key);

  @override
  State<Faq_page> createState() => _Faq_pageState();
}

class _Faq_pageState extends State<Faq_page> {
  String imgPath = "assets/images/product[0].jpg";
  final picker = ImagePicker();
  PickedFile? pickedImage;
  late File imageFile;
  bool _load = true;
  CollectionReference image = FirebaseFirestore.instance.collection("Image");

  _Faq_pageState() {
    imageFile = File(imgPath);
  }

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantController = TextEditingController();
  final detailsController = TextEditingController();

  Future chooseImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    Navigator.pop(context);
    setState(() {
      _load = false;
      if (pickedFile == null) {
        imageFile = File(imgPath);
        return;
      } else {
        imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose an option"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      chooseImage(ImageSource.gallery);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      chooseImage(ImageSource.camera);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              "Please Select the type of Feedback for helping us improve",
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
            buildNumberField(),
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

  buildNumberField() {
    return TextField(
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1.0, color: Colors.brown),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Text(
                    "+91",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.brown[200],
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.brown,
        ),
        hintText: "Phone Number",
        border: OutlineInputBorder(),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 200.0,
      child: Stack(
        children: <Widget>[
          TextField(
            maxLines: 10,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Colors.brown,
                  ),
                ),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[100],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: IconButton(
                          onPressed: () {
                            _showChoiceDialog(context);
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    "Upload a screenshot (optional)",
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  )
                ],
              ),
            ),
          )
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
