import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key, required this.itemData, required this.userData})
      : super(key: key);

  final Map<String, dynamic> itemData;
  final Map<String, dynamic> userData;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  String name = "";
  String price = "";
  String details = "";
  String imgPath = "";
  bool isFavourite = false;
  bool added = false;
  int count = 0;

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
      details = widget.itemData["details"];
      imgPath = widget.itemData["image_url"];
      added = (widget.userData["cart"]).contains(widget.itemData["name"]);
      isFavourite =
          (widget.userData["favourite"]).contains(widget.itemData["name"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .5,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imgPath), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          left: 20,
          top: 20 + MediaQuery.of(context).padding.top,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: ClipOval(
              child: Container(
                  height: 42,
                  width: 41,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        offset: Offset(0, 4),
                        blurRadius: 8)
                  ]),
                  child: Center(
                    child: Icon(Icons.arrow_back),
                  )),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25.0),
                            ),
                          ),
                          InkWell(
                            onTap: () {
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            "Price: ₹ $price /-",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Varela',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 20,
                        right: 20,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          details,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Varela',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
                              backgroundColor: Colors.brown,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (count < 1) {
                                  return;
                                }
                                setState(() {
                                  count--;
                                });
                              }),
                          Text("${count}"),
                          FloatingActionButton(
                              backgroundColor: Colors.brown,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  count++;
                                });
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Material(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
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
                              child: Container(
                                  height: 45,
                                  width: 129,
                                  decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          if (!added) ...[
                                            Icon(Icons.shopping_basket,
                                                color: Colors.white,
                                                size: 12.0),
                                            Text('Add to cart',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Varela',
                                                    fontSize: 12.0)),
                                          ],
                                          if (added) ...[
                                            Icon(Icons.remove_circle_outline,
                                                color: Colors.white,
                                                size: 12.0),
                                            Text('Remove from cart',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Varela',
                                                    fontSize: 12.0)),
                                          ],
                                        ]),
                                  )),
                            ),
                            Container(
                                height: 45,
                                width: 129,
                                decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Buy',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'Varela',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                )))
      ],
    ));
  }
}
