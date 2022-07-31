import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liberty_fashion/src/core/utils/app_utils.dart';
import 'package:liberty_fashion/src/core/widgets/app_bar/liberty_fashion_appbar.dart';
import 'package:liberty_fashion/src/core/widgets/buttons/liberty_fashion_button.dart';
import 'package:liberty_fashion/src/core/widgets/input_fields/liberty_fashion_text_field.dart';
import 'package:liberty_fashion/src/features/auth/reset_password/reset_password.dart';
import 'package:liberty_fashion/src/features/auth/signup/signup.dart';
import 'package:liberty_fashion/src/core/models/user_model.dart' as user_model;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/api/auth_api.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController(text: 'test@gmail.com');
  final TextEditingController _passwordTextEditingController =
      TextEditingController(text: 'tester');

  bool _obscurePassword = true;

  final AuthApi _authApi = AuthApi();

  late user_model.User currentUser;

  void setObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    form?.save();
    if (form!.validate()) {
      logger.i("Valid form");
      return true;
    } else {
      logger.i("Invalid form");
    }
    return false;
  }

  void validateAndSubmit() async {
    final form = _formKey.currentState;
    form?.save();
    if (validateAndSave()) {
      EasyLoading.show();
      logger.i("email  ${_emailTextEditingController.text}");
      logger.i("password ${_passwordTextEditingController.text}");
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailTextEditingController.text,
                password: _passwordTextEditingController.text);

        if (userCredential.user != null) {
          logger.i("New Sign in: ${userCredential.user!.uid}");

          DocumentSnapshot doc =
              await _authApi.getUserDocById(userCredential.user!.uid);

          currentUser = user_model.User.fromSnapshot(doc);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('auth', true);

          prefs.setString('email', currentUser.email);
          prefs.setString('displayName', currentUser.displayName);
          prefs.setString('photoUrl', currentUser.photoUrl);
          prefs.setString('id', currentUser.id);
          prefs.setString('username', currentUser.username);

          EasyLoading.showSuccess("");
        }
      } on FirebaseAuthException catch (e) {
        logger.i("e $e");
        if (e.code == 'user-not-found') {
          logger.i('No user found for that email.');
          EasyLoading.showError("User does not exist.");
        } else if (e.code == 'wrong-password') {
          logger.i('Wrong password provided for that user.');
          EasyLoading.showError("Invalid username or password");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LibertyFashionAppBar(title: "Fashion App"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/images/brand_logo.svg",
                        semanticsLabel: 'Liberty Fashion App brand logo')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Log in",
                      style: TextStyle(color: Colors.black, fontSize: 48),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Container(
                      height: 5,
                      width: 60,
                      color: primaryColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Please login to your account for a personalised experience",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 44,
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    return validateEmail(val ?? '');
                  },
                  controller: _emailTextEditingController,
                  labelText: "Email",
                ),
                const SizedBox(
                  height: 20,
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.text,
                  obscureText: _obscurePassword,
                  validator: (val) {
                    return validateText(val ?? '', "Password");
                  },
                  controller: _passwordTextEditingController,
                  labelText: "Password",
                  setObscureText: setObscurePassword,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 14.5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordView(),
                      ),
                    );
                  },
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: LibertyFashionButton.outline(
                          onPressed: validateAndSubmit,
                          buttonText: "LOG IN",
                          buttonTextColor: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: LibertyFashionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                          },
                          buttonText: "CREATE ACCOUNT",
                          buttonTextColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }
}
