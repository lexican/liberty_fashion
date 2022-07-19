import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/utils/app_utils.dart';
import 'package:liberty_fashion/src/core/widgets/app_bar/liberty_fashion_appbar.dart';
import 'package:liberty_fashion/src/core/widgets/buttons/liberty_fashion_button.dart';
import 'package:liberty_fashion/src/core/widgets/input_fields/liberty_fashion_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailtTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  String _email = '';
  String _password = '';
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
                height: 27,
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
                height: 14.5,
              ),
              GestureDetector(
                onTap: () {},
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
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: LibertyFashionButton.outline(
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
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: LibertyFashionButton(
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
    );
  }
}
