import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
backgroundColor: Color(0xFFFCFAF8),
body:ListView(
  children: <Widget>[
    SizedBox(height: 15.0),
    Container(
      padding: EdgeInsets.only(right:15.0),
      width: MediaQuery.of(context).size.width - 30.0,
      height: MediaQuery.of(context).size.width - 50.0,
      child: GridView.count(
        crossAxisCount: 2,
        primary: false,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.8,
        children: <Widget>[
_buildCard("Gulab Jamun", "\ Rs.500", "assets/product[0].jpg", false, false, context)
        ],
        )
    ),
  ],
)
   );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added, bool isFavourite, context){
    return Padding(
      padding: EdgeInsets.only(top:15.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavourite ? Icon(Icons.favorite, color: Colors.deepPurple[400]) :
                    Icon(Icons.favorite_border,color: Colors.deepPurple[400])
                  ]
                )
                ),
                Hero(
                  tag: imgPath,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      image:DecorationImage(
                        image: AssetImage( imgPath)
                        , fit: BoxFit.contain
                        )
                    )
                  )
                ),
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
                    Padding(padding: EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black,
                      height: 1.0
                    )
                    ),
                    Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                      children: [
                        if(!added)... [
                          Icon(Icons.shopping_basket,
                          color: Colors.deepPurple[400],
                          size: 12.0),
                          Text('Add to cart', 
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Varela',
                    fontSize: 12.0)),
                        ],
                        if(!added)... [
                          Icon(Icons.remove_circle_outline,
                          color: Colors.deepPurple[400],
                          size: 12.0),
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