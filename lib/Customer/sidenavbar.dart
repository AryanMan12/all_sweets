import 'dart:developer';

import 'package:all_sweets/Customer/about_us.dart';
import 'package:all_sweets/Customer/cart.dart';
import 'package:all_sweets/Customer/customer_main.dart';
import 'package:all_sweets/Customer/orders.dart';
import 'package:all_sweets/Customer/Faq.dart';
import 'package:all_sweets/Customer/profile_page.dart';
import 'package:all_sweets/Customer/wishlist.dart';
import 'package:all_sweets/Login&SignUp/login_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  String user = FirebaseAuth.instance.currentUser?.email as String;
  CollectionReference customers =
      FirebaseFirestore.instance.collection("Customer");

  Future<Map<String, dynamic>> getData() async {
    Map<String, dynamic> userData =
        (await customers.doc(user).get()).data() as Map<String, dynamic>;
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: FutureBuilder(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Text("loading...");
                  }
                  return Text(snapshot.data["name"]);
                }),
            accountEmail: FutureBuilder(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Text("loading...");
                  }
                  return Text(snapshot.data["email"]);
                }),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage())),
                  child: Image.asset(
                    "assets/images/product[0].jpg",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerBottomNav(userId: user)),
                    (Route<dynamic> route) => false,
                  )),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('My Wishlist'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => WishListPage())),
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('My Orders'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => OrdersPage())),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My Cart'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage())),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => AboutUs())),
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback and Support'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Faq_page())),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => {
              FirebaseAuth.instance.signOut(),
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false,
              )
            },
          ),
        ],
      ),
    );
  }
}
