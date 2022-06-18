import 'package:acul_komputer/constants.dart';
import 'package:flutter/material.dart';
import 'package:acul_komputer/screens/profile/user/UserData.dart';
import 'package:acul_komputer/screens/profile/widgets/appbar_widget.dart';

class EditDescriptionFormPage extends StatefulWidget {
  @override
  _EditDescriptionFormPageState createState() =>
      _EditDescriptionFormPageState();
}

class _EditDescriptionFormPageState extends State<EditDescriptionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void updateUserValue(String description) {
    user.address = description;
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
                SizedBox(
                  width: 350,
                  height: 30,
                  child: const Text(
                    "Input Alamat",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kTextLightColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    width: 350,
                    height: 193,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length > 200) {
                          return 'Kolom Kosong';
                        }
                        return null;
                      },
                      controller: descriptionController,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kTextColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: splas, width: 2.0),
                        ),
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 100),
                        hintMaxLines: 3,
                        hintText:
                            'Nothing Last Forever We Can Change the Future.',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: MaterialButton(
                        color: Color(0xFF1F4E99),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            updateUserValue(descriptionController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Update',
                          style:
                              TextStyle(fontSize: 15, color: kTextLightColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
