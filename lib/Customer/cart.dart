import 'package:all_sweets/Customer/card_horizontal.dart';
import 'package:all_sweets/Customer/sidenavbar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            "Cart",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          elevation: 8,
        ),
        body: ListView(
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
                  children: <Widget>[
                    CardHorizontal(),
                    CardHorizontal(),
                    CardHorizontal(),
                    CardHorizontal(),
                    CardHorizontal(),
                  ],
                )),
          ],
        ));
  }
}
