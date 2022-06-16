import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:acul_komputer/getx_controller/login_controller.dart';
import 'package:acul_komputer/screens/register/register_screen.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    void _login() async {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
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
                      controller: _emailController,
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
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ],
              ),
            ],
            )
          ),

          Container(
            margin: const EdgeInsets.only(top: 30, right: 25, left: 25),
            child: AnimatedButton(
              text: 'Login',
              height: 30,
              color: Colors.blueAccent,
              pressEvent: () async {
                _login();
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('don\'t have account?'),
              TextButton(
                child: const Text(
                  'Login',
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
            ),
        ],
      ),
    );

  }
}

// class Login extends StatelessWidget {
//   Login({Key? key}) : super(key: key);

//   final GetxLoginController formController = Get.put(GetxLoginController());
//   final GetxLoginController getFormController = Get.find();
//   @override
//   Widget build(BuildContext context) { 
//     return Scaffold(
//       backgroundColor:const Color.fromARGB(255, 255, 255, 255),
//       body: ListView(
//         children: [
//           Center(
//             child: Image.asset(
//               "assets/images/login_logo.png",
//               width: MediaQuery.of(context).size.width*.4,
//               height: MediaQuery.of(context).size.width*.5,
//             ),
//           ),

//           SizedBox(
//             height: MediaQuery.of(context).size.height*.04,
//           ),

//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
//                 child: TextFormField(
//                   controller: formController.usernameEditingController,
//                   onChanged: (newValue) {
//                     formController.setUsername(newValue);
//                   },
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Username',
//                   ),
//                 ),
//               ),
//             ],
//           ),
          
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: TextFormField(
//                   obscureText: true,
//                   controller: formController.passwoerdEditingController,
//                   onChanged: (newValue) {
//                     formController.setPassword(newValue);
//                   },
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Password',
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           Container(
//             margin: const EdgeInsets.only(top: 30, right: 25, left: 25),
//             child: AnimatedButton(
//               text: 'Login',
//               height: 30,
//               color: Colors.blueAccent,
//               pressEvent: () {
//                 AwesomeDialog(
//                   context: context,
//                   animType: AnimType.LEFTSLIDE,
//                   headerAnimationLoop: false,
//                   dialogType: DialogType.SUCCES,
//                   showCloseIcon: true,
//                   title: 'Success',
//                   desc:
//                       """
// Nama: $username 
// Harga: $password
// berhasil login!
//                       """,
//                   btnOkOnPress: () {
//                     debugPrint('OnClcik');
//                   },
//                   btnOkIcon: Icons.check_circle,
//                   onDissmissCallback: (type) {
//                     debugPrint('Dialog Dissmiss from callback $type');
//                   },
//                 ).show();
//               },
//             ),
//           ),
//           Row(
//             children: <Widget>[
//               Text('Does not have account?'),
//               TextButton(
//                 child: const Text(
//                   'Register',
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) {
//                       return Register();
//                     }),
//                   );
//                 },
//               )
//             ],
//             mainAxisAlignment: MainAxisAlignment.center,
//             ),
//         ],
//       ),
//     );
//   }
// }
