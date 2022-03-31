import 'package:flutter/material.dart';
import 'package:liberty_fashion/utils/utils.dart';

class ProductDetailsImage extends StatelessWidget {
  final String imageUrl;

  const ProductDetailsImage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              color: Colors.transparent,
            ),
            Container(
              height: size.height - 24,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                color: Colors.transparent,
                height: kToolbarHeight,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: primaryColor,
                          ),
                          onPressed: () {
                            //_select(choices[0]);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
