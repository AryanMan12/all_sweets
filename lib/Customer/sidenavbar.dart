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
                child: Image.network(
                  'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2F736x%2F8f%2F50%2Ff2%2F8f50f2912d33e43d0d904b94fcb981b8.jpg&imgrefurl=https%3A%2F%2Fin.pinterest.com%2Fpin%2F815784919989095072%2F&tbnid=x7Vdo8Lb7xG23M&vet=12ahUKEwivp_OJu935AhVDjtgFHQptCnkQMyg0egQIARBI..i&docid=cNhPD_tYQx6GkM&w=735&h=960&q=professional%20profile%20image%20hd&hl=en&ved=2ahUKEwivp_OJu935AhVDjtgFHQptCnkQMyg0egQIARBI',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  'https://in.pinterest.com/pin/850265604642444047/',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Friends'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}