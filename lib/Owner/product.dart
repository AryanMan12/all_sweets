import 'package:all_sweets/Owner/Product_add.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final String name = "Gulab Jamun";

  final String price = "Rs.500";

  final String quantity = "500 grams";

  final String imgPath = "assets/images/product[0].jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.brown[400],
        foregroundColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddProducts())),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 97, 61, 48),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            color: Colors.white),
                        const Text(
                          'Add Product',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 80,
                  width: 400,
                  child: Column(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Ink.image(
                                    height: 170,
                                    image: AssetImage(
                                      imgPath,
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
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
                                  Icon(Icons.edit_note,
                                      color: Colors.brown[300]),
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.brown[300],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Ink.image(
                                    height: 170,
                                    image: AssetImage(
                                      imgPath,
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
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
                                    Icons.edit_note,
                                    color: Colors.brown[300],
                                  ),
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.brown[300],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
