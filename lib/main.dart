import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/features/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liberty Fashion App',
      theme: ThemeData(
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