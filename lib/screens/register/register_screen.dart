import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:posttest6_2009106050_riskykurniawan/getx_controller/login_controller.dart';
import 'package:posttest6_2009106050_riskykurniawan/getx_controller/register_controller.dart';

import '../login/login_screen.dart';


class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final GetxRegisterController formController = Get.put(GetxRegisterController());
  final GetxRegisterController getFormController = Get.find();

  @override
  Widget build(BuildContext context) { 
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    var username = getFormController.username;
    var password = getFormController.password;
    var fullname = getFormController.fullname;
    var email = getFormController.email;
    var address = getFormController.address;
    bool _success;

    void _register() async {
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

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

          Form(
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: TextFormField(
                      controller: formController.usernameEditingController,
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
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: TextFormField(
                      obscureText: true,
                      controller: formController.passwordEditingController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: TextFormField(
                      controller: formController.fullnameEditingController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Fullname',
                      ),
                    ),
                  ),
                ],
              ),

              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: TextFormField(
                      controller: formController.emailEditingController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                ],
              ),

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: TextFormField(
                      controller: formController.addressEditingController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Address',
                      ),
                    ),
                  ),
                ],
              ),
            ],)
          ),

          Container(
            margin: const EdgeInsets.only(top: 30, right: 25, left: 25),
            child: AnimatedButton(
              text: 'Register',
              height: 30,
              color: Colors.blueAccent,
              pressEvent: () {
                _register();
                users.add({
                  'username': formController.passwordEditingController.text,
                  'password': formController.passwordEditingController.text,
                  'address': formController.addressEditingController.text,
                  'email': formController.emailEditingController.text,
                  'fullname': formController.fullnameEditingController.text
                });
                AwesomeDialog(
                  context: context,
                  animType: AnimType.LEFTSLIDE,
                  headerAnimationLoop: false,
                  dialogType: DialogType.SUCCES,
                  showCloseIcon: true,
                  title: 'Success',
                  desc: "Akun telah berhasil dibuat !",
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
              Text('have account?'),
              TextButton(
                child: const Text(
                  'Login',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return Login();
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
