import 'package:acul_komputer/getx_controller/register_controller.dart';
import 'package:acul_komputer/screens/login/login_screen.dart';
import 'package:acul_komputer/screens/profile/widgets/appbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:acul_komputer/getx_controller/login_controller.dart';
// import 'package:acul_komputer/getx_controller/register_controller.dart';

// import '../login/login_screen.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// class Register extends StatelessWidget {
//   Register({Key? key}) : super(key: key);

//   final GetxRegisterController tc = Get.put(GetxRegisterController());
  // Widget form(BuildContext context) => 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF2E394C), 
//       resizeToAvoidBottomInset: false,
//       appBar: buildAppBar(context),
//       body: Center(
//         child: 
//             form(context),
//         ),
//     );
//   }
// }

class Register extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => 
      RegisterState();
}
class RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  late bool _success;
  String? _userEmail;
  @override
  Widget build(BuildContext context) { 
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    void _register() async {
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Password terlalu lemah."),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email sudah terdaftar."),
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
      } catch (e) {
        print(e);
      } 
    }

      
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context),
      backgroundColor: Color(0xFF2E394C),
      body: Center(
        child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Text("REGISTER", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(.5))),
          ),
          SizedBox(height: 40),
          Flexible(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                filled: true,
                border: InputBorder.none,
                fillColor: Color.fromARGB(255, 55, 77, 116),
                labelText: "Email",
              ),
              controller: _emailController,
              ),
            ),
          SizedBox(height: 20),
          Flexible(
            child: TextField(
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                filled: true,
                border: InputBorder.none,
                fillColor: Color.fromARGB(255, 55, 77, 116),
                labelText: "Password",
              ),
              controller: _passwordController,
              ),
            ),
          SizedBox(height: 20),
          Flexible(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                filled: true,
                border: InputBorder.none,
                fillColor: Color.fromARGB(255, 55, 77, 116),
                labelText: "Nama",
              ),
              controller: _fullnameController,
              ),
            ),
          SizedBox(height: 20),
          Flexible(
            child: TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                filled: true,
                border: InputBorder.none,
                fillColor: Color.fromARGB(255, 55, 77, 116),
                labelText: "Nomor Telpon",
              ),
              controller: _phoneController,
              ),
            ),
          SizedBox(height: 20),
          Flexible(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                filled: true,
                border: InputBorder.none,
                fillColor: Color.fromARGB(255, 55, 77, 116),
                labelText: "Alamat",
              ),
              controller: _addressController,
              ),
            ),
          SizedBox(height: 20),
          Container(
            child: AnimatedButton(
              borderRadius: BorderRadius.circular(4.0),
              text: 'Register',
              buttonTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
              color: Color(0xFF1F4E99),
              pressEvent: () async {
                _register();
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: const Text(
                  'Sudah memiliki Akun?',
                  style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.normal)
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
            ),

        ],
      ),
    ), 
    ),
    );
  }
}









// class Register extends StatelessWidget {
//   Register({Key? key}) : super(key: key);

//   final GetxRegisterController formController = Get.put(GetxRegisterController());
//   final GetxRegisterController getFormController = Get.find();

//   @override
//   Widget build(BuildContext context) { 
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection('users');

//     var username = getFormController.username;
//     var password = getFormController.password;
//     var fullname = getFormController.fullname;
//     var email = getFormController.email;
//     var address = getFormController.address;
//     bool _success;

//     void _register() async {
//       try {
//         final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email.value,
//           password: password.value,
//         );
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           print('The password provided is too weak.');
//         } else if (e.code == 'email-already-in-use') {
//           print('The account already exists for that email.');
//         }
//       } catch (e) {
//         print(e);
//       }
//     }

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

//           Form(
//             child: Column(children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
//                     child: TextFormField(
//                       controller: formController.usernameEditingController,
//                       decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: 'Username',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
              
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
//                     child: TextFormField(
//                       obscureText: true,
//                       controller: formController.passwordEditingController,
//                       decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: 'Password',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
//                     child: TextFormField(
//                       controller: formController.fullnameEditingController,
//                       decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: 'Fullname',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

              
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
//                     child: TextFormField(
//                       controller: formController.emailEditingController,
//                       decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: 'Email',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//             Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
//                     child: TextFormField(
//                       controller: formController.addressEditingController,
//                       decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: 'Address',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],)
//           ),

//           Container(
//             margin: const EdgeInsets.only(top: 30, right: 25, left: 25),
//             child: AnimatedButton(
//               text: 'Register',
//               height: 30,
//               color: Colors.blueAccent,
//               pressEvent: () {
//                 _register();
//                 users.add({
//                   'username': formController.passwordEditingController.text,
//                   'password': formController.passwordEditingController.text,
//                   'address': formController.addressEditingController.text,
//                   'email': formController.emailEditingController.text,
//                   'fullname': formController.fullnameEditingController.text
//                 });
//                 AwesomeDialog(
//                   context: context,
//                   animType: AnimType.LEFTSLIDE,
//                   headerAnimationLoop: false,
//                   dialogType: DialogType.SUCCES,
//                   showCloseIcon: true,
//                   title: 'Success',
//                   desc: "Akun telah berhasil dibuat !",
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
//               Text('have account?'),
//               TextButton(
//                 child: const Text(
//                   'Login',
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) {
//                       return Login();
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
//  }
// }
