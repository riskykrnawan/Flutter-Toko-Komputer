import 'package:flutter/material.dart';
import 'package:acul_komputer/screens/profile/user/user_data.dart';
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
                  height: 29,
                  child: const Text(
                    "Input Deskripsi",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 100),
                          hintMaxLines: 3,
                          hintText:
                              'Nothing Last Forever We Can Change the Future.'),
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
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            updateUserValue(descriptionController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
