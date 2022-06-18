import 'package:acul_komputer/screens/main/main_screen.dart';
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
  bool? _success;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    void _login() async {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
        );
        setState(() {
          _success = true;
        });
        Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MyMainScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("User tidak ditemukan."),
            ),
          );
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Password tidak benar."),
            ),
          );
        } else if (e.code == 'invalid-email') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email tidak valid."),
            ),
          );
        } else if (e.code == 'unknown') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Field tidak boleh kosong."),
            ),
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF2E394C), 
      body: ListView(
        children: [
          SizedBox(height: 50),
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width*.4,
              height: MediaQuery.of(context).size.width*.5,
            ),
          ),

          Form(
            child: Column(
              children: [
              Center(
                child: Text("LOGIN", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(.5))),
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _emailController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                        filled: true,
                        border: InputBorder.none,
                        fillColor: Color.fromARGB(255, 55, 77, 116),
                        labelText: "Email",
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
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                        filled: true,
                        border: InputBorder.none,
                        fillColor: Color.fromARGB(255, 55, 77, 116),
                        labelText: "Password",
                      ),
                    ),
                  ),
                ],
              ),
            ],
            )
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            child: Container(
              child: AnimatedButton(
                borderRadius: BorderRadius.circular(4.0),
                text: 'Login',
                buttonTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
                color: Color(0xFF1F4E99),
                pressEvent: () async {
                  _login();
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: const Text(
                  'Belum memiliki Akun?',
                  style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.normal)
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
