import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acul_komputer/screens/home/components/jumbotron.dart';
import '/constants.dart';
// import '/models/Product.dart';
import '../../../models/Product.dart';
import '../../../models/ProductRepository.dart';
import '/screens/details/details_screen.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        ),
        const Categories(),
        // StreamBuilder<QuerySnapshot>(
        //   stream: products.snapshots(),
        //   builder: (_, snapshot) {
        //   return (snapshot.hasData)
        //     ? Column(
        //     children: snapshot.data!.docs
        //       .map(
        //         (e) => Container(
        //           height: MediaQuery. of(context).size.height,
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        //             child: GridView.builder(
        //                 itemCount: 3,
        //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //                   crossAxisCount: 2,
        //                   mainAxisSpacing: kDefaultPaddin,
        //                   crossAxisSpacing: kDefaultPaddin,
        //                   childAspectRatio: 0.75,
        //                 ),
        //                 itemBuilder: (context, index) => ItemCard(
        //                   product:
        //                       Product(
        //                       // ignore: prefer_interpolation_to_compose_strings
        //                       category: Category.values.firstWhere((selectedCategory) => selectedCategory.toString() == 'Category.' + e.get('category')),
        //                       id: index,
        //                       image: e.get('image'),
        //                       name: e.get('name'),
        //                       price: e.get('price'),
        //                       description: e.get('description'),
        //                       stock: e.get('stock'),
        //                     ),
        //                   )),
        //           ),
        //         ),
        //       )
        //     .toList(),
        //     )
        //     : Text('Loading...');
        //   },
        // ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: ProductsRepository.loadProducts(Category.all).length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product:
                          ProductsRepository.loadProducts(Category.all)[index],
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
