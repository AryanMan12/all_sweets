import 'package:flutter/material.dart';
import 'package:all_sweets/Owner/order_list.dart';

class BillDetails extends StatefulWidget {
  const BillDetails(int index, {Key? key}) : super(key: key);

  @override
  State<BillDetails> createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  //final int index;

  //BillDetails(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        foregroundColor: Colors.black,
        title: Text('Bill'),
      ),
      body: Center(
          //child: Text(
          //'the details page #$index',
          //style: TextStyle(fontSize: 32.0),
          ),
    );
  }
}
