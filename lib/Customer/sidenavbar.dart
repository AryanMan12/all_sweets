import 'package:all_sweets/Customer/about_us.dart';
import 'package:all_sweets/Customer/cart.dart';
import 'package:all_sweets/Customer/customer_main.dart';
import 'package:all_sweets/Customer/orders.dart';
import 'package:all_sweets/Customer/profile_page.dart';
import 'package:all_sweets/Customer/wishlist.dart';
import 'package:all_sweets/Login&SignUp/login_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  String user = FirebaseAuth.instance.currentUser?.email as String;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('All Sweets'),
            accountEmail: Text('allsweet@gmail.com'),
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
            leading: Icon(Icons.help),
            title: Text('Help & Support'),
            onTap: () => null,
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
