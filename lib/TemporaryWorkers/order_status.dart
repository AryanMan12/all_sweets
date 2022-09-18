import 'package:flutter/material.dart';

class OrderStat extends StatefulWidget {
  const OrderStat({Key? key}) : super(key: key);

  @override
  State<OrderStat> createState() => _OrderStatState();
}

class _OrderStatState extends State<OrderStat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _orderStats("Delivered"),
          Divider(color: Colors.grey),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(
                Icon(Icons.edit, color: Colors.brown),
                Text(
                  "Order Id",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "010",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(
                Icon(Icons.today, color: Colors.brown),
                Text(
                  "Order Date",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "09/08/21",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              flatButton(
                Row(
                  children: [
                    Text("Order Details"),
                    Icon(Icons.chevron_right),
                  ],
                ),
                Colors.greenAccent,
                () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget iconText(Icon iconWidget, Text textWidget) {
    return Row(
      children: [iconWidget, SizedBox(width: 5), textWidget],
    );
  }

  Widget flatButton(
    Widget iconText,
    Color color,
    Function onPressed,
  ) {
    return FlatButton(
      child: iconText,
      onPressed: () {},
      padding: EdgeInsets.all(5),
      color: color,
      shape: StadiumBorder(),
    );
  }

  Widget _orderStats(String status) {
    Icon icon;
    Color color;

    if (status == "pending" || status == "processing" || status == "on-hold") {
      icon = Icon(Icons.timer, color: Colors.orange);
      color = Colors.orange;
    } else if (status == "Delivered") {
      icon = Icon(Icons.check, color: Colors.green);
      color = Colors.green;
    } else if (status == "cancelled" || status == "failed") {
      icon = Icon(Icons.clear, color: Colors.redAccent);
      color = Colors.redAccent;
    } else {
      icon = Icon(Icons.clear, color: Colors.redAccent);
      color = Colors.redAccent;
    }

    return iconText(
        icon,
        Text(
          "Order Status",
          style: TextStyle(
            fontSize: 15,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
