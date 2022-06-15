import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:posttest6_2009106050_riskykurniawan/getx_controller/login_controller.dart';
import 'package:posttest6_2009106050_riskykurniawan/screens/register/register_screen.dart';


class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GetxLoginController formController = Get.put(GetxLoginController());
  final GetxLoginController getFormController = Get.find();
  @override
  Widget build(BuildContext context) { 
    var username = getFormController.username;
    var password = getFormController.password;
    
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        children: [
          Center(
            child: Image.asset(
              "assets/images/login_logo.png",
              width: MediaQuery.of(context).size.width*.4,
              height: MediaQuery.of(context).size.width*.5,
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height*.04,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: TextFormField(
                  controller: formController.usernameEditingController,
                  onChanged: (newValue) {
                    formController.setUsername(newValue);
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
            ],
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  controller: formController.passwoerdEditingController,
                  onChanged: (newValue) {
                    formController.setPassword(newValue);
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(top: 30, right: 25, left: 25),
            child: AnimatedButton(
              text: 'Login',
              height: 30,
              color: Colors.blueAccent,
              pressEvent: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.LEFTSLIDE,
                  headerAnimationLoop: false,
                  dialogType: DialogType.SUCCES,
                  showCloseIcon: true,
                  title: 'Success',
                  desc:
                      """
Nama: $username 
Harga: $password
berhasil login!
                      """,
                  btnOkOnPress: () {
                    debugPrint('OnClcik');
                  },
                  btnOkIcon: Icons.check_circle,
                  onDissmissCallback: (type) {
                    debugPrint('Dialog Dissmiss from callback $type');
                  },
                ).show();
              },
            ),
          ),
          Row(
            children: <Widget>[
              Text('Does not have account?'),
              TextButton(
                child: const Text(
                  'Register',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return Register();
                    }),
                  );
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            ),
        ],
      ),
    );
  }
}
