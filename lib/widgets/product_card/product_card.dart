
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/collections_model.dart';

class ProductCard extends StatelessWidget {
  final CollectionsModel collectionsModel;
  final String title;
  const ProductCard({
    Key? key,
    required this.collectionsModel,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => CollectionDetailsPage2(
              //           item: product,
              //           url: _src,
              //           title: product.name.enUs,
              //           description: description,
              //           price: price,
              //           collectionTitle: title)),
              // )
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: collectionsModel.productImageUrl,
                placeholder: (context, url) => const SizedBox(
                    height: 150,
                    child: Center(child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Center(
                    child: Container(
                  color: Colors.white,
                  height: 150,
                )),
                fadeOutDuration: const Duration(seconds: 1),
                fadeInDuration: const Duration(seconds: 3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                    child: Text(
                  collectionsModel.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                IconButton(
                    onPressed: () {
                      //scaffoldKey.currentState
                      //.showBottomSheet((context) => _buildModal());
                    },
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
