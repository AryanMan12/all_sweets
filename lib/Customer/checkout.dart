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