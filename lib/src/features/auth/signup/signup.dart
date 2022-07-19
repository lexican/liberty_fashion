import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liberty_fashion/src/core/utils/app_utils.dart';
import 'package:liberty_fashion/src/core/widgets/app_bar/liberty_fashion_appbar.dart';
import 'package:liberty_fashion/src/core/widgets/buttons/liberty_fashion_button.dart';
import 'package:liberty_fashion/src/core/widgets/input_fields/liberty_fashion_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final TextEditingController _emailtTextEditingController =
      TextEditingController();

  final TextEditingController _firstNameTextEditingController =
      TextEditingController();

  final TextEditingController _lastNameTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();

  String _email = '';
  String _firstName = '';
  String _lastName = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LibertyFashionAppBar(title: "Fashion App"),
      body: SingleChildScrollView(
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
                onChanged: (String val) {
                  _firstName = val;
                },
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
                onChanged: (String val) {
                  _lastName = val;
                },
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
                onChanged: (String val) {
                  _email = val;
                },
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
                onChanged: (String val) {
                  _password = val;
                },
                validator: (val) {
                  return validateText(val ?? '', "Password");
                },
                controller: _passwordTextEditingController,
                labelText: "Password",
              ),
              const SizedBox(
                height: 20,
              ),
              LibertyFashionTextField(
                keyboardType: TextInputType.text,
                onChanged: (String val) {
                  _confirmPassword = val;
                },
                validator: (val) {
                  return validateText(val ?? '', "Confirm Password");
                },
                controller: _passwordTextEditingController,
                labelText: "Confirm Password",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: LibertyFashionButton(
                        buttonText: "SIGN UP",
                        buttonTextColor: Colors.white,
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
                        style:
                            const TextStyle(color: primaryColor, fontSize: 12),
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
    );
  }
}
