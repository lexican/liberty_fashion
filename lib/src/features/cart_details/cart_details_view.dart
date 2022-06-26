import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/constants/collection_name.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';
import 'package:liberty_fashion/src/features/cart_details/carousel_model.dart';
import 'package:liberty_fashion/src/features/men_measurement_view/men_measurement_view.dart';
import 'package:liberty_fashion/src/features/product_customize/product_customize_view.dart';
import 'package:liberty_fashion/src/features/women_measurement_view/women_measurement_view.dart';

class CartDetailsView extends StatefulWidget {
  final CartModel cartItem;
  const CartDetailsView({Key? key, required this.cartItem}) : super(key: key);

  @override
  State<CartDetailsView> createState() => _CartDetailsViewState();
}

class _CartDetailsViewState extends State<CartDetailsView> {
  final CarouselController _controller = CarouselController();

  late CartModel cartItem;
  List<CarouselModel> carouselList = [];

  TextStyle headingStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );

  TextStyle meansurementStyle = const TextStyle(
    fontFamily: "SegoeUi",
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  EdgeInsets margin = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 4,
  );

  @override
  void initState() {
    super.initState();
    cartItem = widget.cartItem;
    logger.i("cart item: ${cartItem.toJson().toString()}");
    if (cartItem.collectionName != "Fabrics") {
      carouselList.clear();
      carouselList.add(CarouselModel(
          url: cartItem.product?.productImageUrl ?? '', title: "Style"));
      carouselList.add(CarouselModel(
          url: cartItem.fabric?.productImageUrl ?? '', title: "Fabric"));
    } else {
      carouselList.clear();
      carouselList.add(CarouselModel(
          url: cartItem.product?.productImageUrl ?? '', title: "Style"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Cart Details",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductCustomizeView(
                    cart: cartItem,
                    collectionName: cartItem.collectionName ?? '',
                    mode: "Edit",
                    product: widget.cartItem.product ?? ProductModel(),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: primaryColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                ...carouselList.map(
                  (item) => Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(item.url,
                              fit: BoxFit.cover, width: 1000.0),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                '${item.title.toString()} ${(carouselList.indexOf(item) + 1)}/${carouselList.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
              options: CarouselOptions(enlargeCenterPage: true, height: 200),
              carouselController: _controller,
            ),
            if (cartItem.collectionName != CollectionName.fabricCollectionName)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: margin,
                    child: Row(
                      children: [
                        Text(
                          "Style",
                          style: headingStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: margin,
                    child: Row(
                      children: [Text(cartItem.product?.name ?? '')],
                    ),
                  ),
                  Container(
                    margin: margin,
                    child: Text("Fabric", style: headingStyle),
                  ),
                  Container(
                    margin: margin,
                    child: Row(
                      children: [Text(cartItem.fabric?.name ?? '')],
                    ),
                  ),
                  cartItem.gender == "Male"
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: MenMeasurementView(
                            type: cartItem.menStyle ?? '',
                            showEditIcon: false,
                            measurementMen: cartItem.menMeasurement!,
                            onEditFunction: () {},
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: WomenMeasurementView(
                            showEditIcon: false,
                            measurementWomen: cartItem.womenMeasurement!,
                            type: cartItem.womenStyle,
                            onEditFunction: () {},
                          ),
                        )
                ],
              ),
            if (cartItem.collectionName == CollectionName.fabricCollectionName)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: margin,
                    child: Row(
                      children: [
                        Text(
                          "Style",
                          style: headingStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: margin,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItem.fabric?.name ?? ''),
                      ],
                    ),
                  ),
                  Container(
                    margin: margin,
                    child: Text("Number of Yards", style: headingStyle),
                  ),
                  Container(
                    margin: margin,
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            cartItem.fabricNoOfYards.toString(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
