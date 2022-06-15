import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetxLoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  void setUsername(String value) {
    username.value = value;
  }
  void setPassword(String value) {
    password.value = value;
  }

  final usernameEditingController = TextEditingController();
  final passwoerdEditingController = TextEditingController();
}