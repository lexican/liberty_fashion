import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/models/models.dart';

import '../../../core/utils/utils.dart';

class CollectionCategoryCard extends StatelessWidget {
  const CollectionCategoryCard(
      {Key? key, required this.item, required this.onTap})
      : super(key: key);
  final CollectionCategoryModel item;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: GestureDetector(
        onTap: () => {onTap(item)},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(item.collectionImageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.collectionName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffFCFCFC),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
