import 'package:acul_komputer/constants.dart';
import 'package:flutter/material.dart';
import 'package:acul_komputer/screens/profile/user/UserData.dart';
import 'package:acul_komputer/screens/profile/widgets/appbar_widget.dart';

class EditAddressFormPage extends StatefulWidget {
  const EditAddressFormPage({Key? key}) : super(key: key);

  @override
  EditAddressFormPageState createState() {
    return EditAddressFormPageState();
  }
}

class EditAddressFormPageState extends State<EditAddressFormPage> {
  final _formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  void updateUserValue(String address) {
    user.address = address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backColor,
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                    width: 320,
                    child: Text(
                      "Input Alamat",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kTextLightColor),
                      textAlign: TextAlign.left,
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kolom Kosong.';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kTextColor, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: splas, width: 2.0),
                              ),
                              labelText: 'Alamat Anda',
                              labelStyle: TextStyle(color: kTextColor)),
                          controller: addressController,
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: MaterialButton(
                            color: Color(0xFF1F4E99),
                            onPressed: () {
                                updateUserValue(addressController.text);
                                Navigator.pop(context);
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                  fontSize: 15, color: kTextLightColor),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}
