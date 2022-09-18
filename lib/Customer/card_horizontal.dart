import 'package:flutter/material.dart';

import 'item_detail.dart';

class CardHorizontal extends StatefulWidget {
  const CardHorizontal({Key? key}) : super(key: key);

  @override
  State<CardHorizontal> createState() => _CardHorizontalState();
}

class _CardHorizontalState extends State<CardHorizontal> {
  final String name = "Gulab Jamun";

  final String price = "Rs.500";

  final String quantity = "500 grams";

  final String imgPath = "assets/images/product[0].jpg";

  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 16,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => ItemDetail())),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Ink.image(
                      height: 180,
                      image: AssetImage(
                        imgPath,
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(price),
                      Text(quantity),
                    ],
                  ),
                ),
                ButtonBar(
                  children: [
                    Icon(
                      Icons.shopping_basket_outlined,
                      color: Colors.brown,
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          click = !click;
                        });
                      },
                      child: Icon(
                        (click == false)
                            ? Icons.favorite_border_outlined
                            : Icons.favorite,
                        color: Colors.brown,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
