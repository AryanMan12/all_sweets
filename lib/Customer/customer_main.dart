import 'package:all_sweets/Customer/other_items_page.dart';
import 'package:all_sweets/Customer/snacks_page.dart';
import 'package:all_sweets/Customer/sweets_page.dart';
import 'package:all_sweets/Login&SignUp/sign_up.dart';
import 'package:flutter/material.dart';

class CustomerBottomNav extends StatefulWidget {
  const CustomerBottomNav({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<CustomerBottomNav> createState() => _CustomerBottomNavState();
}

class _CustomerBottomNavState extends State<CustomerBottomNav> {
  int pageNum = 0;

  static const List<Widget> _Pages = <Widget>[
    SweetsPage(),
    SnacksPage(),
    OtherItemsPage()
  ];

  void _onPageSelected(int index) {
    setState(() {
      pageNum = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _Pages.elementAt(pageNum),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/laddu_icon.png"),
                  size: 28),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/samosa_icon.png"),
                  size: 28),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/beverage_icon.png"),
                  size: 28),
              label: '',
              backgroundColor: Colors.white),
        ],
        currentIndex: pageNum,
        onTap: _onPageSelected,
      ),
    );
  }
}
