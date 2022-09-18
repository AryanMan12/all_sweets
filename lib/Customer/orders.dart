import 'package:all_sweets/Customer/card_horizontal.dart';
import 'package:all_sweets/Customer/sidenavbar.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
                  ],
                )),
          ],
        ));
  }
}
