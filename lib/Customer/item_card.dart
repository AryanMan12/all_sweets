import 'package:all_sweets/Customer/item_detail.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final String name = "Gulab Jamun";

  final String price = "Rs.500";

  final String imgPath = "assets/images/product[0].jpg";

  final bool added = false;

  final bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ItemDetail())),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    isFavourite
                        ? Icon(Icons.favorite, color: Colors.deepPurple[400])
                        : Icon(Icons.favorite_border,
                            color: Colors.deepPurple[400])
                  ])),
              Hero(
                  tag: Null,
                  child: Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath),
                              fit: BoxFit.contain)))),
              SizedBox(height: 7.0),
              Text(price,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
              Text(name,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(color: Colors.black, height: 1.0)),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!added) ...[
                        Icon(Icons.shopping_basket,
                            color: Colors.deepPurple[400], size: 12.0),
                        Text('Add to cart',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 12.0)),
                      ],
                      if (added) ...[
                        Icon(Icons.remove_circle_outline,
                            color: Colors.deepPurple[400], size: 12.0),
                        Text('Remove from cart',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 12.0)),
                      ],
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
