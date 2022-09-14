import 'package:all_sweets/Owner/order_bill_details.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: _buildListView(context),
    );
  }
}

ListView _buildListView(BuildContext context) {
  return ListView.builder(
    itemCount: 50,
    itemBuilder: (_, index) {
      return Card(
        child: ListTile(
        title: Text('Order No. $index'),
        subtitle: Text('Info'),
        leading: Icon(Icons.list),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => BillDetails(index)
              ),
            );
          }),
        ),
      );
    },
  );
}