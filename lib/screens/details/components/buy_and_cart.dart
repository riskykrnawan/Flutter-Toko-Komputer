import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import '/models/Product.dart';
import '../../../models/Product.dart';
import 'package:provider/provider.dart';
import '../../../models/ProductRepository.dart';
import 'package:acul_komputer/models/state_model.dart';

import '../../../constants.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: kTextLightColor,
              ),
              onPressed: () {
                final model =
                    Provider.of<AppStateModel>(context, listen: false);
                model.addProductToCart(product.id);
              },
            ),
          ),
          Expanded(
            child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      // primary: product.color,
                    ),
                    onPressed: () {
                      final model =
                          Provider.of<AppStateModel>(context, listen: false);
                      model.addProductToCart(product.id);
                    },
                    child: Text(
                      "Buy Now".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}
