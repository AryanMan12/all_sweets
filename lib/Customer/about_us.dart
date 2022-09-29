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
            subtitle: Center(child: Text("Sweetness Made in India")),
          ),
          FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
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
            title: Row(
              children: <Widget>[
                Icon(Icons.phone),
                Text("About Us"),
              ],
            ),
            subtitle: Text(
                'All Sweets are a manufacturer, wholesaler and retailer of Indian sweets and snacks. Our products span the entire range of traditional North Indian, Bengali, Gujarati and dry fruit sweets. We are also known for our Indian snacks, savories (farsan & namkeen), fast food, chaats, Punjabi and South Indian cuisines and delicious lassi. Our products span a wide spectrum of more than 500 lines of sweets and snacks for every occasion and befitting every budget. Our sweets like our festivals are colorful, diverse in taste, and rooted in regional traditions of confectionary making.'),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.location_city),
                Text(
                    "All Sweets, Opposite Railway Station, Malad (W), Mumbai 400064"),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.call),
                Text("+91 (0) 22 28899501 – 05"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
