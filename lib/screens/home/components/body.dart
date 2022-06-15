import 'package:flutter/material.dart';
import 'package:posttest6_2009106050_riskykurniawan/screens/home/components/jumbotron.dart';
import '/constants.dart';
import '/models/Product.dart';
import '/screens/details/details_screen.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        ),
        const Categories(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Image.asset(
                "assets/images/laptop1.png",
                width: 400.0,
              ),
              Image.asset(
                "assets/images/laptop2.png",
                width: 400.0,
              ),
              Image.asset(
                "assets/images/laptop3.png",
                width: 400.0,
              ),
              Image.asset(
                "assets/images/laptop4.png",
                width: 400.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                    )),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        ),
      ],
    );
  }
}
