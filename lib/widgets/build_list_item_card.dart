import 'package:flutter/material.dart';
import 'package:liberty_fashion/models/build_grid_item.dart';
import 'package:liberty_fashion/utils/parameters.dart';

class BuildListItemCard extends StatelessWidget {
  const BuildListItemCard({Key? key, required this.item, required this.onTap}) : super(key: key);
  final BuildGridItem item;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        color: Parameters.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: GestureDetector(
          onTap: () => {
            onTap(item.collectionName)
          },
          child: Container(
              //MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.5,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(item.url), fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFCFCFC)),
                  textAlign: TextAlign.center,
                ),
              )),
        ));
  }
}
