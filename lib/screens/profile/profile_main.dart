import 'package:acul_komputer/constants.dart';
import 'package:acul_komputer/screens/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: 'Roboto',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.grey,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.0))))),
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0.0))),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              primary: kTextLightColor,
            ),
          )),
      home: ProfilePage(),
    );
  }
}
