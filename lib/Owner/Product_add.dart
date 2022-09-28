import 'dart:async';
import 'dart:io';
import 'package:all_sweets/Owner/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  String imgPath = "assets/images/product[0].jpg";
  final picker = ImagePicker();
  PickedFile? pickedImage;
  late File imageFile;
  bool _load = true;
  CollectionReference products =
      FirebaseFirestore.instance.collection("Products");

  _AddProductsState() {
    imageFile = File(imgPath);
  }
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantController = TextEditingController();
  final detailsController = TextEditingController();

  List<String> items = <String>[
    'Sweets',
    'Snacks',
    'Others',
  ];

  String dropdownValue = 'Sweets';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a New Product"),
        backgroundColor: Colors.brown[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                width: 220,
                child: Card(
                    color: Colors.brown[400],
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              _showChoiceDialog(context);
                            },
                            icon: const Icon(Icons.add),
                            color: Colors.black),
                        InkWell(
                          onTap: () => _showChoiceDialog(context),
                          child: const Text(
                            'Add an Image',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 25.0),
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                child: _load == false
                    ? Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(imageFile),
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(15.0),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            imgPath,
                            height: 250.0,
                            width: 300.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 70),
                padding: const EdgeInsets.all(15.0),
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.brown,
                ),
                child: DropdownButton(
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  value: dropdownValue,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.brown[300],
                  items: items.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                        hintText: 'Enter Product name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                      controller: detailsController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Product details',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                      controller: quantController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Quantity',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                      controller: priceController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Product Price',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Products())),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.brown[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: onSave,
                      child: Center(
                        child: Text(
                          'Save',
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
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> onSave() async {
    final storageRef = FirebaseStorage.instance.ref("Product Images/");
    String name = nameController.text.trim();
    await storageRef.child("$name.jpg").putFile(imageFile);
    String imgUrl = await storageRef.child("$name.jpg").getDownloadURL();
    String quant = quantController.text.trim();
    String price = priceController.text.trim();
    String details = detailsController.text.trim();

    await products
        .doc(name)
        .set({
          "name": name,
          "details": details,
          "price": price,
          "quantity": quant,
          "image_url": imgUrl,
          "type": dropdownValue,
          "availibility": "0",
        })
        .then((value) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Product Added"))))
        .onError((error, stackTrace) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed to Add Data"))));
  }
}
