import 'dart:developer';

import 'package:all_sweets/Customer/item_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({Key? key, required this.itemData, required this.userData})
      : super(key: key);
  final Map<String, dynamic> itemData;
  final Map<String, dynamic> userData;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  String name = "";
  String price = "";
  String imgPath = "";
  String quantity = "";

  bool added = false;
  bool isFavourite = false;

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
    if (widget.itemData.isNotEmpty) {
      name = widget.itemData["name"];
      price = widget.itemData["price"];
      imgPath = widget.itemData["image_url"];
      quantity = widget.itemData["quantity"];
      added = (widget.userData["cart"]).contains(widget.itemData["name"]);
      isFavourite =
          (widget.userData["favourite"]).contains(widget.itemData["name"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemData.isEmpty) {
      return Container();
    }
    return ListView(children: [
      Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetail(
                        itemData: widget.itemData,
                        userData: widget.userData,
                      ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                isFavourite = !isFavourite;
                                List favList = widget.userData["favourite"];
                                if (isFavourite) {
                                  favList.add(name);
                                  customers
                                      .doc(user)
                                      .update({"favourite": favList});
                                } else {
                                  favList.remove(name);
                                  customers
                                      .doc(user)
                                      .update({"favourite": favList});
                                }
                              });
                            },
                            child: Icon(
                              (isFavourite == true)
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.brown,
                            ),
                          )
                        ])),
                Hero(
                    tag: name,
                    child: Container(
                        height: 75.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imgPath),
                                fit: BoxFit.fitWidth)))),
                SizedBox(height: 7.0),
                Text(name,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Text("₹ $price /- ($quantity)",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(color: Colors.black, height: 1.0)),
                Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: InkWell(
                    onTap: (() {
                      setState(() {
                        added = !added;
                        List cart = widget.userData["cart"];
                        if (added) {
                          cart.add(name);
                          customers.doc(user).update({"cart": cart});
                        } else {
                          cart.remove(name);
                          customers.doc(user).update({"cart": cart});
                        }
                      });
                    }),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (!added) ...[
                            Icon(Icons.shopping_basket,
                                color: Colors.brown[400], size: 12.0),
                            Text('Add to cart',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Varela',
                                    fontSize: 12.0)),
                          ],
                          if (added) ...[
                            Icon(Icons.remove_circle_outline,
                                color: Colors.brown[400], size: 12.0),
                            Text('Remove from cart',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Varela',
                                    fontSize: 12.0)),
                          ],
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
