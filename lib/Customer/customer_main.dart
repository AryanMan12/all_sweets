import 'package:all_sweets/Login&SignUp/sign_up.dart';
import 'package:flutter/material.dart';

class CustomerBottomNav extends StatefulWidget {
  const CustomerBottomNav({Key? key}) : super(key: key);

  @override
  State<CustomerBottomNav> createState() => _CustomerBottomNavState();
}

class _CustomerBottomNavState extends State<CustomerBottomNav> {
  int pageNum = 0;

  static const List<Widget> _Pages = <Widget>[SignUpPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // child: _Pages.elementAt(pageNum),
        child: Text("Hello World"),
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
      ),
    );
  }
}
