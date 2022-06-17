import 'package:flutter/material.dart';
// import '/models/Product.dart';
import '../../../models/Product.dart';
import '../../../models/ProductRepository.dart';
import '/screens/details/components/body.dart';
import '/screens/details/details_screen.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return DetailsScreen(product: product);
          }),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                // color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.name,
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "Rp. ${product.price}",
            style: const TextStyle(
                color: Color(0xff515979), fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
