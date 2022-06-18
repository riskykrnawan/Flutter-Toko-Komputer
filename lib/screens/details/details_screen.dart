import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/constants.dart';
// import '/models/Product.dart';
import '../../models/Product.dart';
import '../../models/ProductRepository.dart';
import '/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbars,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: appbars,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: kTextLightColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: kTextLightColor,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
