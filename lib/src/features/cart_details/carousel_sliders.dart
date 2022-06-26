// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class CarouselSlider extends StatelessWidget {
//   const CarouselSlider({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return items
//         .map((item) => Container(
//               child: Container(
//                 margin: EdgeInsets.all(5.0),
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                     child: Stack(
//                       children: <Widget>[
//                         Image.network(item.url,
//                             fit: BoxFit.cover, width: 1000.0),
//                         Positioned(
//                           bottom: 0.0,
//                           left: 0.0,
//                           right: 0.0,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Color.fromARGB(200, 0, 0, 0),
//                                   Color.fromARGB(0, 0, 0, 0)
//                                 ],
//                                 begin: Alignment.bottomCenter,
//                                 end: Alignment.topCenter,
//                               ),
//                             ),
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 10.0, horizontal: 20.0),
//                             child: Text(
//                               '${item.title.toString()} ${(items.indexOf(item) + 1)}/${items.length}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//             ))
//         .toList();
//   }
// }