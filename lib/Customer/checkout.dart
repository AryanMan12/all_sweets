/**import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/**import 'package:all_sweets/Customer/card_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final String name = "Gulab Jamun";
  final String price = "Rs.500";
  final String quantity = "500 grams";
  final List<Checkout> data = Checkout.data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text('My Order'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          //_buildShopwidget(),
          _buildItemDetails(),
          _buildNotes(),
          Divider(
            height: kVerticalPadding,
            indent: kHorizontalPadding,
            endIndent: kHorizontalPadding,
          ),
          _buildSummary(),
          Padding(
            padding: const EdgeInsets.all(kHorizontalPadding),
            child: ElevatedButton(
              onPressed: () {}, 
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }

  /**Widget _buildShopWidget() {
    return Row(
      children: [
        ItemImageRadius(
          imagePath: 'assets/home/Home-screen-image.jpg',
          width: 300.w,
          height: 300.W,
        ), // ItemImageRadius
        Column(
          children: [
            Text('King Burgers', style: Theme.of(context).textTheme.headline5)
          ],
        )
      ],
    );
  }**/

  Widget _buildItemDetails() {
    return Container(
      color: Colors.lightBlue,
      padding: EdgeInsets.all(kHorizontalPadding),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            Checkout data = Checkout.data.[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name),
                Text(quantity),
                Text(
                  price,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: kVerticalPadding,
            );
          },
          itemCount: Checkout.data.length),
    );
  }

  Widget _buildNotes() {
    return Padding(
      padding: EdgeInsets.symmetric (horizontal: kHorizontalPadding),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Delivery Instructions', 
          style: Theme.of(context).textTheme.bodyText1),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon (Icons.add),
            label: const Text('Add Notes'),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: EdgeInsets.symmetric (horizontal: kHorizontalPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sub Total',
                  style: Theme.of(context).textTheme.bodyText1),
              Text(
                '\$68',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.red,
                  ),
              ),
            ],
          ),
          SizedBox(height: kVerticalPAdding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery cost',
                  style: Theme.of(context).textTheme.bodyText1),
              Text(
                '\$2',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.red,
                  ),
              ),
            ],
          ),
          Divider(
            height: kVerticalPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                  style: Theme.of(context).textTheme.bodyText1),
              Text(
                '\$70',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.red,
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
**/

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final String name = "Gulab Jamun";
  final String price = "Rs.500";
  final String quantity = "500 grams";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text(
          'Order Summary',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              "What is your issue? Would you like to give us a feedback?",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20.0),
            buildFeedbackForm(),
            SizedBox(height: 20.0),
            buildNumberField(),
            Spacer(),
            Row(
              children: <Widget>[
                Expanded(
                    child: FlatButton(
                  onPressed: () {},
                  color: Colors.brown,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  buildNumberField() {
    return TextField(
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1.0, color: Colors.brown),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Text(
                    "+91",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.brown[200],
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.brown,
        ),
        hintText: "Phone Number",
        border: OutlineInputBorder(),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 200.0,
      child: Stack(
        children: <Widget>[
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Add your address over here",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Colors.brown,
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 203, 184, 176)),
              ),
            ),
          ),
          /**Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Colors.brown,
                  ),
                ),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[100],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: IconButton(
                          onPressed: () {
                            _showChoiceDialog(context);
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    "Upload a screenshot (optional)",
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  )
                ],
              ),
            ),
          )**/
        ],
      ),
    );
  }

  buildCheckItem(title) {
    return Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.check_circle, color: Colors.brown),
            SizedBox(width: 10),
            Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ))
          ],
        ));
  }
}
**/