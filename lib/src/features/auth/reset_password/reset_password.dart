import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';
import 'package:liberty_fashion/src/core/widgets/input_fields/liberty_fashion_text_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewInState();
}

class _ResetPasswordViewInState extends State<ResetPasswordView> {
  final TextEditingController _emailTextEditingController =
      TextEditingController(text: 'test@gmail.com');
  late String _email;
  final auth = FirebaseAuth.instance;
  String err = "";

  final _formKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = _formKey.currentState;
    form?.save();
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void showCenterShortToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  void validateAndSubmit() async {
    err = "";

    final form = _formKey.currentState;
    form?.save();
    if (validateAndSave()) {
      EasyLoading.show();
      FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: _email)
          .get()
          .then(
            (QuerySnapshot querySnapshot) => {
              if (querySnapshot.size > 0)
                {
                  auth.sendPasswordResetEmail(email: _email),
                  EasyLoading.showSuccess(
                      'A password reset link has been sent to your mail'),
                  Navigator.of(context).pop()
                }
              else
                {EasyLoading.showError('Account does not exist')}
            },
          );
    } else {
      logger.i("Invalid form");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Reset Password'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            LibertyFashionTextField(
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                return validateEmail(val ?? '');
              },
              controller: _emailTextEditingController,
              labelText: "Email",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Reset'),
                  onPressed: () {
                    validateAndSubmit();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
