import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/app.dart';
import 'package:liberty_fashion/src/core/services/locator/locator.dart';
import 'package:liberty_fashion/src/features/tab_view/tab_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const LibertyFashionApp());
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
      home: const TabView(),
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