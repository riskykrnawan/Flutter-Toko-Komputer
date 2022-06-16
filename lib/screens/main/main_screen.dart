import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:posttest6_2009106050_riskykurniawan/screens/cart/shopping_cart_tab.dart';
import '../../getx_controller/dashboard_controller.dart';
import '/screens/forms/form_screen.dart';
import '/screens/home/home_screen.dart';
import '/screens/toko_saya/toko_saya_screen.dart';
import 'package:get/get.dart';

class MyMainScreen extends StatelessWidget {
  const MyMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Products",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart),
                label: "Shopping Cart",
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  label: "About Us"),
            ],
          ),
          tabBuilder: (context, index) {
            late final CupertinoTabView returnValue;

            switch (index) {
              case 0:
                returnValue = CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(child: HomeScreen());
                });
                break;
              case 1:
                returnValue = CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(child: ShoppingCartTab());
                });
                break;
              case 2:
                returnValue = CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(child: TokoSaya());
                });
                break;
            }
            return returnValue;
          },
        );
      },
    );
  }
}
