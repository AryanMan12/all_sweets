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
        title: const Text("Product"),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddProducts())),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
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
                            fontSize: 16,
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
                                      color: Colors.deepPurple[200]),
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.deepPurple[200],
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
                                    color: Colors.deepPurple[200],
                                  ),
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.deepPurple[200],
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
