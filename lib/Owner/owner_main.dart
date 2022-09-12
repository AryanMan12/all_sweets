import 'package:all_sweets/Owner/daily_khata.dart';
import 'package:all_sweets/Owner/dashboard.dart';
import 'package:all_sweets/Owner/order_list.dart';
import 'package:flutter/material.dart';

class OwnerBottomNav extends StatefulWidget {
  const OwnerBottomNav({Key? key}) : super(key: key);

  @override
  State<OwnerBottomNav> createState() => _OwnerBottomNavState();
}

class _OwnerBottomNavState extends State<OwnerBottomNav> {
  int pageNum = 0;

  static const List<Widget> _Pages = <Widget>[
    Dashboard(),
    DailyKhata(),
    Text("Page 3"),
    OrderList()
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
              icon: Icon(Icons.bar_chart, size: 28),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_note, size: 28),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_note, size: 28),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.table_chart, size: 28),
              label: '',
              backgroundColor: Colors.white),
        ],
        currentIndex: pageNum,
        onTap: _onPageSelected,
      ),
    );
  }
}
