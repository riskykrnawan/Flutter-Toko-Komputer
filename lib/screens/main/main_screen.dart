import 'package:flutter/material.dart';
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
        return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  const HomeScreen(),
                  MyForm(),
                  TokoSaya(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Color(0xff515979),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    color: Color(0xff515979),
                  ),
                  label: 'News',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xff515979),
                  ),
                  label: 'Account',
                ),
              ],
            ));
      },
    );
  }
}
