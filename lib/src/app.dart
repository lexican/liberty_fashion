import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liberty_fashion/src/features/tab_view/tab_view.dart';

class LibertyFashionApp extends StatefulWidget {
  const LibertyFashionApp({Key? key}) : super(key: key);

  @override
  State<LibertyFashionApp> createState() => _LibertyFashionAppState();
}

class _LibertyFashionAppState extends State<LibertyFashionApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (_, __) => MaterialApp(
              title: 'Liberty Fashion App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const TabView(),
            ),
          );
        }
        //Todo handle this well, when firebase fails to initialize
        return const CircularProgressIndicator(
          color: Colors.white,
        );
      },
    );
  }
}