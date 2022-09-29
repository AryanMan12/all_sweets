import 'package:all_sweets/Customer/card_horizontal.dart';
import 'package:all_sweets/Customer/sidenavbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
          backgroundColor: Colors.brown[400],
          foregroundColor: Colors.black,
          title: Text(
            "My Orders",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          elevation: 8,
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: products.get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              documentData = snapshot.data?.docs
                  .map((e) => e.data() as Map<String, dynamic>?)
                  .toList();

              for (var i = documentData.length - 1; i >= 0; i--) {
                if (!(userData["orders"].contains(documentData[i]["name"]))) {
                  documentData.removeAt(i);
                }
              }

              return ListView(
                children: <Widget>[
                  SizedBox(height: 2.0),
                  Container(
                      width: MediaQuery.of(context).size.width - 30.0,
                      height: MediaQuery.of(context).size.height - 98.0,
                      child: GridView.count(
                          crossAxisCount: 1,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 15.0,
                          childAspectRatio: 1.2,
                          children: List<Widget>.generate(
                              documentData.length,
                              (index) => CardHorizontal(
                                    itemData: (documentData[index]
                                        as Map<String, dynamic>),
                                    userData: userData,
                                  )))),
                ],
              );
            }));
  }
}
