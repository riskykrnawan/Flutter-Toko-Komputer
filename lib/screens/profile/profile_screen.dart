//PUNYA ACUN THE CUL

// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   String nama = " ", telepon = "", email = "";
//   TextEditingController controllerA = TextEditingController();
//   TextEditingController controllerB = TextEditingController();
//   TextEditingController controllerC = TextEditingController();

// @override
//   Widget build(BuildContext context) { 

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         elevation: 0,
//         title: const Text(
//           "My Profile",
//           style: TextStyle(
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontSize: 24,
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 200,
//                 height: 250,
//                 margin: EdgeInsets.only(top: 61),
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/back.jpeg"),
//                   ),
//                 ),
//               ),
//             ]
//           ),
            
//           SizedBox(height:  30),
//           TextFormField(
//             controller: controllerA,
//             decoration: InputDecoration(
//               labelText: "Masukkan Nama Anda",
//               icon: Icon(Icons.people),
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height:  30),
//           TextFormField(
//             controller: controllerB,
//             decoration: InputDecoration(
//               labelText: "Masukkan No Telepon",
//               icon: Icon(Icons.phone_android_rounded),
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 30),
//           TextFormField(
//             controller: controllerC,
//             decoration: InputDecoration(
//               labelText: "Masukkan Rmail",
//               icon: Icon(Icons.email),
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 30),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 nama = controllerA.text;
//                 telepon = controllerB.text;
//                 email = controllerC.text;
//               });
//             }, 
//           child: Text("Submit"),
//           ),
//         ],
//       ),
//     );
//   }
// }