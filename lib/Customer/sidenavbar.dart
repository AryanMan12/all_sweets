import 'package:all_sweets/Customer/cart.dart';
import 'package:all_sweets/Customer/customer_main.dart';
import 'package:all_sweets/Customer/orders.dart';
import 'package:all_sweets/Customer/wishlist.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
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
                child: Image.asset(
                  "assets/images/product[0].jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerBottomNav()),
                    (Route<dynamic> route) => false,
                  )),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Wishlist'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => WishListPage())),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage())),
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('My Orders'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => OrdersPage())),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
