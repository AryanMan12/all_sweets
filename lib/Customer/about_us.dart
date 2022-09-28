import 'package:flutter/material.dart';
import 'package:all_sweets/Customer/sidenavbar.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final String imgPath = "assets/images/product[0].jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text(
          'About Us',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            //overflow: Overflow.visible,
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.cover,
                  image: AssetImage(imgPath)),
              Positioned(
                bottom: -60.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(imgPath),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          ListTile(
            title: Center(child: Text('All Sweets')),
            subtitle: Center(child: Text('data data data')),
          ),
          FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            label: Text(
              'Contact Us',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.brown,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          ListTile(
            title: Text('About Us'),
            subtitle: Text(
                'qwefbjrhvbrbvyurbvubavbuarbvabvuerbvhbauvbearvbhbvurbvurbvvhbruvbervrivbreiubierbvirebvirebb'),
          ),
        ],
      ),
    );
  }
}
