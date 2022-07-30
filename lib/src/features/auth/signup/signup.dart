import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liberty_fashion/src/core/utils/app_utils.dart';
import 'package:liberty_fashion/src/core/widgets/app_bar/liberty_fashion_appbar.dart';
import 'package:liberty_fashion/src/core/widgets/buttons/liberty_fashion_button.dart';
import 'package:liberty_fashion/src/core/widgets/input_fields/liberty_fashion_text_field.dart';
import 'package:liberty_fashion/src/features/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final TextEditingController _emailtTextEditingController =
      TextEditingController(text: 'test@gmail.com');

  final TextEditingController _firstNameTextEditingController =
      TextEditingController(text: 'Miami');

  final TextEditingController _lastNameTextEditingController =
      TextEditingController(text: 'Daniel');

  final TextEditingController _passwordTextEditingController =
      TextEditingController(text: 'tester');

  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController(text: 'tester');

  bool _obscurePassword = false;
  bool _obscureConfirmPassword = false;
  bool isLoading = false;
  var err = '';

  final _formKey = GlobalKey<FormState>();

  void setObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void setObscureConfirmPassword() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    form?.save();
    if (form!.validate()) {
      logger.i("valid form");
      return true;
    } else {
      logger.i("invalid form");
      return false;
    }
  }

  void validateAndSubmit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    err = "";
    setState(() {
      isLoading = true;
    });
    final form = _formKey.currentState;
    form?.save();
    if (validateAndSave()) {
      logger.i("Here");
      final DateTime timestamp = DateTime.now();
      if (_passwordTextEditingController.text ==
          _confirmPasswordTextEditingController.text) {
        EasyLoading.show();
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailtTextEditingController.text,
                password: _passwordTextEditingController.text)
            .then(
              (currentUser) => FirebaseFirestore.instance
                  .collection("users")
                  .doc(currentUser.user!.uid)
                  .set({
                    "id": currentUser.user!.uid,
                    "photoUrl": "",
                    "email": _emailtTextEditingController.text,
                    "displayName":
                        "${_lastNameTextEditingController.text} ${_firstNameTextEditingController.text}",
                    "bio": "",
                    "timestamp": timestamp,
                  })
                  .then(
                    (result) => {
                      EasyLoading.showSuccess(''),
                      prefs.setBool('auth', true),
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                          (_) => false),
                      form?.reset()
                    },
                  )
                  .catchError(
                    (err) => {
                      logger.i("err 1 $err"),
                      EasyLoading.showError("Email already exist"),
                    },
                  ),
            )
            .catchError(
              (err) => {
                logger.i("err 2 $err"),
                EasyLoading.showError("Email already exist"),
              },
            );
      } else {
        EasyLoading.showError("Password must match");
      }
    } else {}
    setState(() {
      isLoading = false;
    });
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
                      "Register",
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
                        "Please register your account to get bonus and cheap products",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 34,
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    return validateText(val ?? '', "Firstname");
                  },
                  controller: _firstNameTextEditingController,
                  labelText: "Firstname",
                ),
                const SizedBox(
                  height: 20,
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    return validateText(val ?? '', "Lastname");
                  },
                  controller: _lastNameTextEditingController,
                  labelText: "Lastname",
                ),
                const SizedBox(
                  height: 20,
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    return validateEmail(val ?? '');
                  },
                  controller: _emailtTextEditingController,
                  labelText: "Email",
                ),
                const SizedBox(
                  height: 20,
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    return validatePassword(val ?? '');
                  },
                  controller: _passwordTextEditingController,
                  labelText: "Password",
                  isPassword: true,
                  setObscureText: setObscurePassword,
                  obscureText: _obscurePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    return validatePassword(val ?? '');
                  },
                  controller: _confirmPasswordTextEditingController,
                  labelText: "Confirm Password",
                  setObscureText: setObscureConfirmPassword,
                  isPassword: true,
                  obscureText: _obscureConfirmPassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: LibertyFashionButton(
                          buttonText: "SIGN UP",
                          buttonTextColor: Colors.white,
                          onPressed: validateAndSubmit,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      //style: defaultStyle,
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Already have an account? ',
                          style:
                              TextStyle(color: Color(0xFF707070), fontSize: 12),
                        ),
                        TextSpan(
                          text: 'LOGIN',
                          style: const TextStyle(
                              color: primaryColor, fontSize: 12),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 34,
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
    _emailtTextEditingController.dispose();
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
  }
}
