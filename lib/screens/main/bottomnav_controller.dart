import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
