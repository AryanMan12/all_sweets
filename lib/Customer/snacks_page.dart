import 'package:all_sweets/Customer/item_card.dart';
import 'package:all_sweets/Customer/sidenavbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SnacksPage extends StatefulWidget {
  const SnacksPage({Key? key}) : super(key: key);

  @override
  State<SnacksPage> createState() => _SnacksPageState();
}

class _SnacksPageState extends State<SnacksPage> {
  String user = FirebaseAuth.instance.currentUser?.email as String;

  CollectionReference products =
      FirebaseFirestore.instance.collection("Products");

  CollectionReference customers =
      FirebaseFirestore.instance.collection("Customer");

  Future<Map<String, dynamic>> getData() async {
    Map<String, dynamic> userData =
        (await customers.doc(user).get()).data() as Map<String, dynamic>;
    return userData;
  }

  List<dynamic> documentData = [];
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((value) {
      setState(() {
        userData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            "Snacks",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          elevation: 0,
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: products.where("type", isEqualTo: "Snacks").get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              documentData = snapshot.data?.docs
                  .map((e) => e.data() as Map<String, dynamic>?)
                  .toList();

              return ListView(
                children: <Widget>[
                  SizedBox(height: 2.0),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                      width: MediaQuery.of(context).size.width - 30.0,
                      height: MediaQuery.of(context).size.height - 50.0,
                      child: GridView.count(
                          crossAxisCount: 2,
                          primary: false,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 15.0,
                          childAspectRatio: 0.8,
                          children: List<Widget>.generate(
                              documentData.length,
                              (index) => ItemCard(
                                    itemData: (documentData[index]
                                        as Map<String, dynamic>),
                                    userData: userData,
                                  )))),
                ],
              );
            }));
  }
}
