import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'MyUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  final FirebaseAuth auth = FirebaseAuth.instance;

  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static Future<MyUser> getDataUser(String uid) async {    
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var fullname = data?['fullname']; // <-- The value
      var address = data?['address']; // <-- The value
      var email = data?['email']; // <-- The value
      var phoneNumber = data?['phoneNumber']; // <-- The value
      // Call setState if needed.
      return MyUser(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
        name: 'Test Test',
        email: 'aculkomputer@aculxcia.com',
        phone: '0822-5294-0003',
        address: 'Jalan Wakanda No 13.',
      );
    }
    return MyUser(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
        name: 'Unknown',
        email: 'Unknown',
        phone: 'Unknown',
        address: 'Unknown',
      );
  }

  
 
  static MyUser myUser = MyUser(
    image:
        "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
    name: 'Test Test',
    email: 'aculkomputer@aculxcia.com',
    phone: '0822-5294-0003',
    address: 'Jalan Wakanda No 13.',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(MyUser myUser) async {
    final json = jsonEncode(myUser.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static MyUser getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : MyUser.fromJson(jsonDecode(json));
  }
}
