import 'package:flutter/material.dart';


class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
   final String name = "Gulab jamun ";

  final String price = "Rs.500";

  final String details = "Gulab jamun is a sweet confectionary or dessert, originating in the Indian subcontinent";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/product[0].jpg'),
              fit: BoxFit.cover
            ),
          ),
        ),
        Positioned(
          left:30,
          top: 30 + MediaQuery.of(context).padding.top,
          child: InkWell(
            onTap: () { },
            child: ClipOval(
              child: Container(
                height: 42,width: 41,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.25),
                      offset: Offset(0,4),
                      blurRadius: 8
                    )
                  ]
                ),
                child: Center(
                  child: Icon(Icons.arrow_back),
                )
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              ),
              boxShadow:   [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
              )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                  right: 20
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text( name, 
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25.0
                      ),  
                      ),
                    ),
                    InkWell(
                      child: Icon(Icons.favorite_border_outlined,
                      color: Colors.deepPurple),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top:10,
                  left:20,
                  right:20
                ),
                child: Row(children: [
                  Text(price,
                  style:TextStyle(
                    fontSize:18,
                    fontFamily: 'Varela',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  ),
                ],
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                  top:12,
                  left:20,
                  right:20,
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(details,
style:TextStyle(
                    fontSize:18,
                    fontFamily: 'Varela',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  ),
                ),
                ),
               Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    height: 29,
                    width: 29,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontSize:20,
                    fontFamily: 'Varela',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 29,
                    width: 29,
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize:20,
                    fontFamily: 'Varela',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 29,
                    width: 29,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontSize:20,
                    fontFamily: 'Varela',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ]),
               ),

                Material(
                  color: Colors.white,
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    
                    children: [
                      
                      InkWell(
                        onTap: () {},
                        child: Container(

                          height: 39,
                        width: 129,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          
                  
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize:25,
                              fontFamily: 'Varela',
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                              ),
                            ),
                          )
                        ),
                    
                      ),
                     
                      Container(
                        height: 39,
                        width: 129,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'Buy',
                          style: TextStyle(
                            fontSize:25,
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                          ),
                        ),
                      )
                      )
                      
                    ],
                  ),
                ),
              
            ],)
          )
        )
      ],
     )
    );
  }
}


