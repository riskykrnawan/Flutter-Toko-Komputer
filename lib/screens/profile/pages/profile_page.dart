import 'dart:async';

import 'package:acul_komputer/constants.dart';
import 'package:acul_komputer/screens/login/login_screen.dart';
import 'package:acul_komputer/screens/profile/pages/edit_address.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'edit_description.dart';
import 'edit_email.dart';
import 'edit_image.dart';
import 'edit_name.dart';
import 'edit_phone.dart';
import '../user/MyUser.dart';
import '../widgets/display_image_widget.dart';
import '../user/UserData.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final myUser = UserData.myUser;
    final tempUser = UserData.getDataUser(auth.currentUser!.uid);

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");

    return Scaffold(
      backgroundColor: backColor,
      body: ListView(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (context) =>
                            new Login()),
                    (route) => false);
                  },
                  icon: Icon(Icons.logout_rounded, color: Colors.red,),
                  label: Text("Log Out", style: TextStyle(color: Colors.red, fontWeight: FontWeight.normal, fontSize: 15),),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: kTextLightColor,
                ),
              ),
            ),
          ),
          
          SizedBox(
            height: 200,
            child: InkWell(
              onTap: () {
                navigateSecondPage(EditImagePage());
              },
              child: DisplayImage(
                imagePath: myUser.image,
                onPressed: () {},
              ),
            ),
          ),
          
          StreamBuilder<DocumentSnapshot>(
            stream: users.doc(auth.currentUser!.uid).snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
              ? 
                Column(
                  children: [
                    SizedBox(
                      child: buildUserInfoDisplay(snapshot.data!.get('fullname'), 'Nama', EditNameFormPage()),
                    ),
                    SizedBox(
                      child: buildUserInfoDisplayWithoutEditting(snapshot.data!.get('email'), 'Email'),
                    ),
                    SizedBox( 
                      child: buildUserInfoDisplay(snapshot.data!.get('phoneNumber'), 'Nomor Telepon', EditPhoneFormPage()),
                    ),
                    SizedBox( 
                      child: buildUserInfoDisplay(snapshot.data!.get('address'), 'Alamat', EditAddressFormPage(), height: 70, fontHeight: 2.3),
                    ),
                  ],
                ) : Text("Loading...");
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            child: Container(
              child: Column(
                children: [
                  AnimatedButton(
                    borderRadius: BorderRadius.circular(4.0),
                    text: 'Hapus Akun?',
                    buttonTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
                    color: Color.fromARGB(255, 153, 31, 31),
                    pressEvent: () {                      
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.QUESTION,
                        animType: AnimType.SCALE,
                        title: 'Apa anda yakin?',
                        desc: 'Akun yang telah dihapus tidak dapat digunakan kembali!',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Akun terhapus',
                            desc: 'Akun berhasil dihapus',
                            btnOkOnPress: () async {
                              try {
                                await FirebaseAuth.instance.currentUser!.delete();
                                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          new Login()),
                                  (route) => false);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'requires-recent-login') {
                                  print('The user must reauthenticate before this operation can be executed.');
                                }
                              }
                            },
                          ).show();
                        },
                      ).show();
                    },
                  ),
              ],)
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage, {double height = 40, double fontHeight = 1.4}) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                width: 350,
                height: height,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: kTextColor,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          navigateSecondPage(editPage);
                        },
                        child: Text(
                          getValue,
                          style: TextStyle(fontSize: 16, height: fontHeight),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: kTextColor,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ],
          ));
  
  Widget buildUserInfoDisplayWithoutEditting(String getValue, String title, {double height = 40, double fontHeight = 1.4}) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                width: 350,
                height: height,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: kTextColor,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Email tidak dapat diubah."),
                            ),
                          );
                        },
                        child: Text(
                          getValue,
                          style: TextStyle(fontSize: 16, height: fontHeight, color: Colors.grey),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: kTextColor,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ],
          ));

  Widget buildAddress(String  address) => Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 1),
            Container(
              width: 350,
              height: 80,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: kTextColor,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        navigateSecondPage(EditDescriptionFormPage());
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            address,
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: kTextColor,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
