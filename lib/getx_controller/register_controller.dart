import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetxRegisterController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var fullname = ''.obs;
  var email = ''.obs;
  var address = ''.obs;

  final usernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final fullnameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final addressEditingController = TextEditingController();

  void setUsername(String value) {
    username.value = value;
  }
  void setPassword(String value) {
    password.value = value;
  }
  void setFullname(String value) {
    fullname.value = value;
  }
  void setEmail(String value) {
    email.value = value;
  }
  void setaddress(String value) {
    address.value = value;
  }  
}