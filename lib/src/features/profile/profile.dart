import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';
import 'package:liberty_fashion/src/core/widgets/app_bar/liberty_fashion_appbar.dart';
import 'package:liberty_fashion/src/core/widgets/buttons/liberty_fashion_button.dart';
import 'package:liberty_fashion/src/features/auth/signin/signin.dart';
import 'package:liberty_fashion/src/features/tab_view/tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = _auth.currentUser;
  }

  void logout(BuildContext context) async {
    await _auth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('auth', false);
    prefs.remove('email');
    prefs.remove('displayName');
    prefs.remove('photoUrl');
    prefs.remove('id');
    prefs.remove('username');

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const TabView(),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LibertyFashionAppBar(
        title: "Profile",
        leading: SizedBox(),
        actions: [
          // IconButton(
          //   icon: const Icon(
          //     Icons.account_circle,
          //     color: primaryColor,
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const SignIn(),
          //       ),
          //     );
          //   },
          // ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          currentUser != null
              ? Row(
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
                                builder: (context) => const SignIn(),
                              ),
                            );
                          },
                          buttonText: "LOG IN",
                          buttonTextColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: LibertyFashionButton.outline(
                          onPressed: () {},
                          buttonText: "LOG OUT",
                          buttonTextColor: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
