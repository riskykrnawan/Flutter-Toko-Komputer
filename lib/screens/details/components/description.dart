import 'package:flutter/material.dart';
// import '/models/Product.dart';
import '../../../models/Product.dart';
import '../../../models/ProductRepository.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        product.description,
        style: const TextStyle(height: 1.5, color: kTextLightColor),
      ),
    );
  }
}
