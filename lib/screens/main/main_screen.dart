import 'package:acul_komputer/constants.dart';
import 'package:acul_komputer/screens/profile/profile_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:acul_komputer/screens/cart/shopping_cart_tab.dart';
import '../../getx_controller/dashboard_controller.dart';
import 'bottomnav_controller.dart';
import '../profile/profile_screen.dart';
import '/screens/home/home_screen.dart';
import 'package:get/get.dart';

class MyMainScreen extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  MyMainScreen({Key? key}) : super(key: key);

  final screens = [
    const HomeScreen(),
    const ShoppingCartTab(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: backColor,
          body: Obx(
            () => IndexedStack(
              index: bottomNavigationController.selectedIndex.value,
              children: screens,
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white38,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              onTap: (index) {
                bottomNavigationController.changeIndex(index);
              },
              currentIndex: bottomNavigationController.selectedIndex.value,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: appbars,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_checkout_rounded),
                  label: "Shopping Cart",
                  backgroundColor: appbars,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
                  label: "Profile",
                  backgroundColor: appbars,
                ),
              ],
            ),
          ),
        );
        // return CupertinoTabScaffold(
        //   tabBar: CupertinoTabBar(
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.home),
        //         label: "Products",
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.shopping_cart),
        //         label: "Shopping Cart",
        //       ),
        //       BottomNavigationBarItem(
        //           icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),
        //     ],
        //   ),
        //   tabBuilder: (context, index) {
        //     late final CupertinoTabView returnValue;

        //     switch (index) {
        //       case 0:
        //         returnValue = CupertinoTabView(builder: (context) {
        //           return const CupertinoPageScaffold(child: HomeScreen());
        //         });
        //         break;
        //       case 1:
        //         returnValue = CupertinoTabView(builder: (context) {
        //           return const CupertinoPageScaffold(child: ShoppingCartTab());
        //         });
        //         break;
        //       case 2:
        //         returnValue = CupertinoTabView(builder: (context) {
        //           return CupertinoPageScaffold(child: MyProfile());
        //         });
        //         break;
        //     }
        //     return returnValue;
        //   },
        // );
      },
    );
  }
}
