import 'package:awesome_dialog/awesome_dialog.dart';
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
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: Colors.grey,
              ),
              onPressed: () {
                final model =
                    Provider.of<AppStateModel>(context, listen: false);
                model.addProductToCart(product.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Barang berhasil dimasukkan ke Keranjang."),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Color(0xFF1F4E99),
                    ),
                    onPressed: () {
                      final model =
                          Provider.of<AppStateModel>(context, listen: false);
                      model.addProductToCart(product.id);
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.SUCCES,
                        showCloseIcon: true,                        
                        desc: 'Barang telah akan dikirmkan secepatnya',
                        btnOkOnPress: () {
                          debugPrint('OnClcik');
                        },
                        btnOkIcon: Icons.check_circle,
                        onDissmissCallback: (type) {
                          debugPrint(
                              'Dialog Dissmiss from callback $type');
                        },
                      ).show();
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
