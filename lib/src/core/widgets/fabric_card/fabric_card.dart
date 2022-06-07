import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class FabricCard extends StatefulWidget {
  final ProductModel product;
  final Function(dynamic) onFabricSelected;
  final String selectedId;
  const FabricCard(
      {Key? key,
      required this.product,
      required this.onFabricSelected,
      required this.selectedId})
      : super(key: key);

  @override
  State<FabricCard> createState() => _FabricCardState();
}

class _FabricCardState extends State<FabricCard> {
  late ProductModel product;
  late String selectedId;
  @override
  void initState() {
    super.initState();
    product = widget.product;
    selectedId = widget.selectedId;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selectedId == product.id ? Colors.red : Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  height: 120,
                  fit: BoxFit.cover,
                  imageUrl: product.productImageUrl ?? '',
                  placeholder: (context, url) => const SizedBox(
                    height: 120,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Container(
                      color: Colors.white,
                      height: 120,
                    ),
                  ),
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
                    product.name ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                  IconButton(
                    onPressed: () {
                      widget.onFabricSelected(product);
                      Navigator.pop(context, product);
                    },
                    iconSize: 30,
                    icon: const Icon(
                      Icons.add,
                      color: primaryColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
