import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String imgPath = "assets/images/product[0].jpg";
  final picker = ImagePicker();
  PickedFile? pickedImage;
  late File imageFile;
  bool _load = true;
  _AddProductsState() {
    imageFile = File(imgPath);
  }

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

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  bool isObscurePassword = true;
  Map<String, dynamic> userData = {};

  String user = FirebaseAuth.instance.currentUser?.email as String;

  CollectionReference customers =
      FirebaseFirestore.instance.collection("Customer");

  Future<Map<String, dynamic>> getData() async {
    Map<String, dynamic> userData =
        (await customers.doc(user).get()).data() as Map<String, dynamic>;
    return userData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text(
          'Profile Page',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1)),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(imgPath),
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  _showChoiceDialog(context);
                                },
                                padding: EdgeInsets.only(left: 82, top: 80),
                                icon: const Icon(Icons.edit),
                                color: Colors.white),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30),
              FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Text("loading...");
                    }
                    return buildTextField("Full Name", snapshot.data['name'],
                        false, nameController..text = snapshot.data['name']);
                  }),
              FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Text("loading...");
                    }
                    return buildTextField("Email", snapshot.data['email'],
                        false, emailController..text = snapshot.data['email']);
                  }),
              FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Text("loading...");
                    }
                    return buildTextField("Phone", snapshot.data['phone'],
                        false, phoneController..text = snapshot.data['phone']);
                  }),
              FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Text("loading...");
                    }

                    return buildTextField(
                        "Address",
                        snapshot.data['address'],
                        false,
                        addressController..text = snapshot.data['address']);
                  }),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 15,
                          //letterSpacing: 2,
                          color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.brown),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String _name = nameController.text.trim();
                      String _phone = phoneController.text.trim();
                      String _address = addressController.text.trim();
                      String _email = addressController.text.trim();

                      if (_name.isEmpty ||
                          _phone.isEmpty ||
                          _address.isEmpty ||
                          _email.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Text Fields Cannot be Empty")));
                      } else if (_phone.length != 10) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Enter a Valid Phone Number")));
                      } else {
                        customers.doc(user).update({
                          "name": _name,
                          "phone": _phone,
                          "address": _address,
                        });
                      }
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 15,
                          //letterSpacing: 2,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      //backgroundColor:
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? true : false,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                    });
                  },
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
