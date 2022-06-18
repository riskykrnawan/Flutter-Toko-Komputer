import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetxRegisterController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var fullname = "".obs;
  var address = "".obs;
  var phone = "".obs;

  final passwordEditingController = TextEditingController();
  final fullnameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final addressEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
}