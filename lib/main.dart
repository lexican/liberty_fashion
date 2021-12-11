import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/screens/home/home.dart';

void main() {
  initializeDefault();
  runApp(const MyApp());
}

Future<void> initializeDefault() async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

//  return BlocProvider(
//               blocs: [
//           Bloc((i) => CartListBloc()),
//           Bloc((i) => CartTotalBlocController()),
//           Bloc((i) => WishListBloc())
//         ],
//           child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//             primarySwatch: Colors.blue,
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//             fontFamily: 'SegoeUi',
//             backgroundColor: Parameters.backgroundColor),
//         home: LandingPage(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );