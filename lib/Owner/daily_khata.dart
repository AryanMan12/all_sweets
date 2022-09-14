import 'package:flutter/material.dart';

class DailyKhata extends StatefulWidget {
  const DailyKhata({Key? key}) : super(key: key);

  @override
  State<DailyKhata> createState() => _DailyKhataState();
}

class _DailyKhataState extends State<DailyKhata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Khata",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        elevation: 6,
      ),
      body: Column(children: [
        Text("Date"),
        Expanded(
          child: ListView(
            children: [],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Enter item"),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Enter price"),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 20.0,
              onPressed: () {},
            ),
          ]),
        ),
      ]),
    );
  }
}
