import 'package:all_sweets/Customer/item_card.dart';
import 'package:flutter/material.dart';

class SnacksPage extends StatefulWidget {
  const SnacksPage({Key? key}) : super(key: key);

  @override
  State<SnacksPage> createState() => _SnacksPageState();
}

class _SnacksPageState extends State<SnacksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            "Snacks",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 2.0),
            Container(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                width: MediaQuery.of(context).size.width - 30.0,
                height: MediaQuery.of(context).size.height - 50.0,
                child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    ItemCard(),
                  ],
                )),
          ],
        ));
  }
}
