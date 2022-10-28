import 'package:all_sweets/Customer/profile_page.dart';
import 'package:all_sweets/Owner/Product_add.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'item_detail.dart';

class CardHorizontal extends StatefulWidget {
  const CardHorizontal({
    Key? key,
    required this.itemData,
    required this.userData,
  }) : super(key: key);
  final Map<String, dynamic> itemData;
  final Map<String, dynamic> userData;

  @override
  State<CardHorizontal> createState() => _CardHorizontalState();
}

class _CardHorizontalState extends State<CardHorizontal> {
  String name = "";
  String price = "";
  String quantity = "";
  String imgPath = "";
  bool isFavourite = false;
  bool added = false;

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
      Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemDetail(
                            itemData: widget.itemData,
                            userData: widget.userData,
                          ))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Ink.image(
                        height: 180,
                        image: NetworkImage(
                          imgPath,
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text("Price: ₹ $price /-"),
                        Text("Quantity: $quantity"),
                      ],
                    ),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                        onPressed: () {
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
                        },
                        child: Icon(
                          (added == true)
                              ? Icons.shopping_basket
                              : Icons.shopping_basket_outlined,
                          color: Colors.brown,
                        ),
                      ),
                      TextButton(
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
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
