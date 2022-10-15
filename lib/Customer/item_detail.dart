import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail(
      {Key? key,
      required Map<String, dynamic> itemData,
      required Map<String, dynamic> userData})
      : super(key: key);

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  final String name = "Gulab jamun ";

  final String price = "Rs.500";

  final String details =
      "Gulab jamun is a sweet confectionary or dessert, originating in the Indian subcontinent";

  bool click = true;

  int count = 0;

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
                image: AssetImage('assets/images/product[0].jpg'),
                fit: BoxFit.cover),
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
                                click = !click;
                              });
                            },
                            child: Icon(
                              (click == false)
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
                            price,
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
                              onTap: () {},
                              child: Container(
                                  height: 45,
                                  width: 129,
                                  decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'Varela',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
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
                                        color: Colors.black),
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
