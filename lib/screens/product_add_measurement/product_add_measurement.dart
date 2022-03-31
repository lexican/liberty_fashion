import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liberty_fashion/models/cart_model.dart';
import 'package:liberty_fashion/models/fabric_model.dart';
import 'package:liberty_fashion/models/product_model.dart';
import 'package:liberty_fashion/models/women_measurement_model.dart';
import 'package:liberty_fashion/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../models/men_measurement_model.dart';
import '../../widgets/decimal_text_input_formatter/decimal_text_input_formatter.dart';

var uuid = Uuid();

class ProceedPage extends StatefulWidget {
  final ProductModel product;
  final CartModel? cart;
  final String collectionName;
  final String mode;

  const ProceedPage({
    Key? key,
    required this.product,
    this.cart,
    required this.collectionName,
    required this.mode,
  }) : super(key: key);

  @override
  _ProceedPageState createState() => _ProceedPageState();
}

class _ProceedPageState extends State<ProceedPage> {
  late ProductModel product;
  late String collectionName;
  late String gender;
  bool showAll = false;
  late String mode;
  late CartModel cart;

  String menStyle = "Regular";
  String womenStyle = "Regular";

  bool showFabricYards = false;

  bool showMeasurement = false;

  MenMeasurementModel measurementMen = MenMeasurementModel();
  WomenMeasurementModel measurementWomen = WomenMeasurementModel();

  ProductModel fabric = ProductModel();

  final TextEditingController _numberOfYardsCL = TextEditingController();

  double numberOfYards = 0;

  TextStyle headingStyle = const TextStyle(
      fontFamily: "Roboto", fontSize: 18, color: Color(0xFF000000));

  @override
  void initState() {
    product = widget.product;
    collectionName = widget.collectionName;
    mode = widget.mode;
    if (widget.cart != null) {
      cart = widget.cart!;
    }

    gender = "Male";

    // _numberOfYardsCL.text = 4.0.toString();

    if (mode == "New") {
      if (widget.collectionName == "Children") {
        showAll = true;
      }
      if (widget.collectionName == "Women") {
        setState(() {
          gender = "Female";
        });
      }

      // loadMenMeasurement();
      // loadWomenMeasurement();
    } else {
      //_numberOfYardsCL.text = widget.cart!.fabricNoOfYards.toString();

      // print("widget.cart.fabricNoOfYards " +
      //     widget.cart!.fabricNoOfYards.toString());
      // loadData();
    }
    super.initState();
  }

  // void updateMeasurement() {
  //   loadMenMeasurement();
  //   loadWomenMeasurement();
  // }

  void openMeasurementForm() {
    if (gender == "Male") {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MenMeasurementModal(
      //               onSave: updateMeasurement,
      //               type: menStyle,
      //             )));
      //   showFloatingModalBottomSheet(
      //       context: context,
      //       builder: (context, scrollController) => MenMeasurementModal(
      //             onSave: updateMeasurement,
      //             type: menStyle,
      //           ));
    } else {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => WomenMeasurementModal(
      //               type: womenStyle,
      //               onSave: updateMeasurement,
      //             )));
      //   showFloatingModalBottomSheet(
      //       context: context,
      //       builder: (context, scrollController) => WomenMeasurementModal(
      //             type: womenStyle,
      //             onSave: updateMeasurement,
      //           ));
    }
  }

  // void loadMenMeasurement() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     if (prefs.getString("measurementMen") != null) {
  //       Map<String, dynamic> item =
  //           json.decode(prefs.getString("measurementMen") ?? "");
  //       //print("item: ${item}");
  //       measurementMen.shoulder = item['shoulder'];
  //       measurementMen.sleeve = item['sleeve'];
  //       measurementMen.chest = item['chest'];
  //       measurementMen.topLength = item['topLength'];

  //       measurementMen.bicep = item['bicep'];
  //       measurementMen.wrist = item['wrist'];

  //       measurementMen.hip = item['hip'];
  //       measurementMen.trouserLength = item['trouserLength'];
  //       measurementMen.thigh = item['thigh'];
  //       measurementMen.trouserTip = item['trouserTip'];
  //       measurementMen.info = item['info'];
  //     }
  //   });
  // }

  // void loadWomenMeasurement() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     if (prefs.getString("measurementWomen") != null) {
  //       Map<String, dynamic> item =
  //           json.decode(prefs.getString("measurementWomen") ?? "");

  //       measurementWomen.shoulder = item['shoulder'];

  //       measurementWomen.sleeve = item['sleeve'];

  //       measurementWomen.sleeveShortLength = item['sleeveShortLength'];
  //       measurementWomen.sleeve34Length = item['sleeve34Length'];
  //       measurementWomen.sleeveFullLength = item['sleeveFullLength'];

  //       measurementWomen.bust = item['bust'];
  //       measurementWomen.bustPoint = item['bustPoint'];

  //       measurementWomen.shoulderToUnderBust = item['shoulderToUnderBust'];
  //       measurementWomen.roundUnderBust = item['roundUnderBust'];
  //       measurementWomen.halfLength = item['halfLength'];
  //       measurementWomen.blouseWaist = item['blouseWaist'];
  //       measurementWomen.blouseLength = item['blouseLength'];

  //       measurementWomen.skirtWaist = item['skirtWaist'];
  //       measurementWomen.hips = item['hips'];

  //       measurementWomen.dressLength = item['dressLength'];

  //       measurementWomen.dress34Length = item['dress34Length'];
  //       measurementWomen.dressKneeLength = item['dressKneeLength'];
  //       measurementWomen.dressHalfLength = item['dressHalfLength'];
  //       measurementWomen.dressFloorLength = item['dressFloorLength'];

  //       measurementWomen.skirtLength = item['skirtLength'];

  //       measurementWomen.skirt34Length = item['skirt34Length'];
  //       measurementWomen.skirtKneeLength = item['skirtKneeLength'];
  //       measurementWomen.skirtShortLength = item['skirtShortLength'];
  //       measurementWomen.skirtFloorLength = item['skirtFloorLength'];

  //       measurementWomen.info = item['info'];
  //     }
  //   });
  // }

  void loadData() {
    if (widget.collectionName == "Children") {
      showAll = true;
      if (cart.menMeasurement != null) {
        setState(() {
          gender = "Male";
        });
      } else {
        setState(() {
          gender = "Female";
        });
      }
    }
    if (widget.collectionName == "Women") {
      setState(() {
        gender = "Female";
      });
    }
    if (widget.collectionName == "Men") {
      setState(() {
        gender = "Male";
      });
    }
    // if (collectionName == "Fabrics") {
    //   setState(() {
    //     fabric.id = cart.fabricId;
    //     fabric.name = cart.fabricName;
    //     fabric.price = cart.fabricPrice;
    //     fabric.url = "";
    //   });
    // }

    if (cart.menMeasurement != null) {
      measurementMen.shoulder = cart.menMeasurement?.shoulder ?? 0.0;
      measurementMen.sleeve = cart.menMeasurement?.sleeve ?? 0.0;
      measurementMen.chest = cart.menMeasurement?.chest ?? 0.0;
      measurementMen.topLength = cart.menMeasurement?.topLength ?? 0.0;

      measurementMen.bicep = cart.menMeasurement?.bicep ?? 0.0;
      measurementMen.wrist = cart.menMeasurement?.wrist ?? 0.0;

      measurementMen.hip = cart.menMeasurement?.hip ?? 0.0;

      measurementMen.trouserLength = cart.menMeasurement?.trouserLength ?? 0.0;
      measurementMen.thigh = cart.menMeasurement?.thigh ?? 0.0;
      measurementMen.trouserTip = cart.menMeasurement?.trouserTip ?? 0.0;
    } else {
      measurementWomen.shoulder = cart.womenMeasurement?.shoulder ?? 0.0;
      measurementWomen.sleeve = cart.womenMeasurement?.sleeve ?? 0.0;
      measurementWomen.bust = cart.womenMeasurement?.bust ?? 0.0;
      measurementWomen.bustPoint = cart.womenMeasurement?.bustPoint ?? 0.0;

      measurementWomen.shoulderToUnderBust =
          cart.womenMeasurement?.shoulderToUnderBust ?? 0.0;
      measurementWomen.roundUnderBust =
          cart.womenMeasurement?.roundUnderBust ?? 0.0;
      measurementWomen.halfLength = cart.womenMeasurement?.halfLength ?? 0.0;
      measurementWomen.blouseWaist = cart.womenMeasurement?.blouseLength ?? 0.0;
      measurementWomen.blouseLength =
          cart.womenMeasurement?.blouseLength ?? 0.0;

      measurementWomen.skirtWaist = cart.womenMeasurement?.skirtLength ?? 0.0;
      measurementWomen.hips = cart.womenMeasurement?.hips ?? 0.0;

      measurementWomen.dressLength = cart.womenMeasurement?.dressLength ?? 0.0;
      measurementWomen.skirtLength = cart.womenMeasurement?.skirtLength ?? 0.0;
    }
  }

  late File _image;
  //final picker = ImagePicker();

  void addToCart(
    ProductModel product,
  ) {
    if (fabric.name != null) {
      double a = numberOfYards * 2;
      double rounded = a.ceil() / 2;
      print(
          "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&7");
      print("rounded: " + rounded.toString());
      print(
          "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&7");
      // bloc.addToList(new CartModel(
      //     catalogId: item.catalogId,
      //     price: price,
      //     total: price,
      //     src: src,
      //     productId: item.productId,
      //     name: item.name.enUs,
      //     id: mode == "Edit" ? cart.id : uuid.v1(),
      //     item: item,
      //     quantity: 1,
      //     men: collectionName == "Men" ? measurementMen : null,
      //     women: collectionName != "Men" ? measurementWomen : null,
      //     fabricId: fabric.id,
      //     fabricName: fabric.name,
      //     fabricNoOfYards: rounded,
      //     fabricPrice: fabric.price,
      //     fabricSrc: fabric.url,
      //     collectionName: collectionName,
      //     menStyle: menStyle,
      //     womenStyle: womenStyle));
    } else {
      print("No fabric selected");
    }
  }

  TextStyle meansurementStyle = const TextStyle(
      fontFamily: "SegoeUi", fontSize: 14, fontWeight: FontWeight.w600);

  // TextStyle headingStyle = TextStyle(
  //     color: Colors.black,
  //     fontSize: 16,
  //     fontFamily: 'Roboto',
  //     fontWeight: FontWeight.w500);

  void pushToNewScreen(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => FabricGrid(
    //             selectedId: fabric != null ? fabric.id : -1,
    //           )),
    // ).then((value) {
    //   // if value is true you get the result as bool else no result
    //   if (value != null) {
    //     setState(() {
    //       fabric = value;
    //     });
    //     print("Value ${value.url.toString()}");
    //     print('Do something after getting result');
    //   } else {
    //     print('Do nothing');
    //   }
    // });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: SizedBox(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    getImage("Gallery");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    getImage("Camera");
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget cartItem() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 120,
      width: double.infinity,
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  width: 85,
                  height: 120,
                  child: CachedNetworkImage(
                    imageUrl: product.productImageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox(
                      width: 85,
                      height: 120,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Container(
                        color: Colors.white,
                        height: 150,
                      ),
                    ),
                    fadeOutDuration: const Duration(seconds: 1),
                    fadeInDuration: const Duration(seconds: 3),
                  ),
                ),
              ),
              (collectionName == "Fabrics")
                  ? Container(
                      alignment: Alignment.bottomLeft,
                      width: 85,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: const Text(
                        "1/1",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    )
                  : Container(
                      alignment: Alignment.bottomLeft,
                      width: 85,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Text(
                        fabric.name != null ? "1/2" : "1/1",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    )
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6,
                ),
                collectionName == "Fabrics"
                    ? Text(
                        fabric.name ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontFamily: "SegoeUi", fontSize: 14),
                      )
                    : Text(
                        product.name ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontFamily: "SegoeUi", fontSize: 14),
                      ),
                //                   : Text(
                //   product.name
                //       " " + fabric.name,
                //   overflow: TextOverflow.ellipsis,
                //   maxLines: 2,
                //   style:
                //       const TextStyle(fontFamily: "SegoeUi", fontSize: 14),
                // ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "\u20A6 " +
                      moneyFormat(fabric.price != null
                          ? (product.price + fabric.price).toString()
                          : product.price.toString()),
                  style: const TextStyle(fontFamily: "SegoeUi", fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget bottom() {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 6, bottom: 20),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: RaisedButton(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(4.0),
  //                 side: const BorderSide(color: primaryColor)),
  //             onPressed: () {
  //               // Navigator.push(
  //               //   context,
  //               //   MaterialPageRoute(builder: (context) => LandingPage()),
  //               // );
  //             },
  //             color: Colors.white,
  //             textColor: primaryColor,
  //             child: Text("CONTINUE SHOPPING".toUpperCase(),
  //                 style: const TextStyle(fontSize: 14)),
  //           ),
  //         ),
  //         const SizedBox(
  //           width: 5,
  //         ),
  //         Expanded(
  //           child: FlatButton(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(4.0),
  //                 side: const BorderSide(color: Colors.red)),
  //             color: primaryColor,
  //             textColor: Colors.white,
  //             padding: const EdgeInsets.all(8.0),
  //             onPressed: () {
  //               if (collectionName == "Fabric") {
  //                 addToCart(fabric);
  //                 // Navigator.push(
  //                 //   context,
  //                 //   MaterialPageRoute(
  //                 //     builder: (context) => CartPage(),
  //                 //   ),
  //                 // );
  //               } else {
  //                 if (fabric.name == null) {
  //                   Fluttertoast.showToast(
  //                       msg: "No Fabric selected",
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.red,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0);
  //                 } else if (numberOfYards > 12) {
  //                   Fluttertoast.showToast(
  //                       msg: "Maximun number of yards is 12",
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.red,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0);
  //                 } else if (numberOfYards < 4) {
  //                   Fluttertoast.showToast(
  //                       msg: "Minimun number of yards is 4",
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.red,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0);
  //                 } else {
  //                   print("here");
  //                   addToCart(product);
  //                   // Navigator.push(
  //                   //   context,
  //                   //   MaterialPageRoute(
  //                   //     builder: (context) => CartPage(),
  //                   //   ),
  //                   // );
  //                 }
  //               }
  //             },
  //             child: Text(
  //               mode == "New" ? "ADD TO CART" : "Update",
  //               style: const TextStyle(
  //                 fontSize: 14.0,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  setSelectedGender(value) {
    if (value != gender) {
      setState(() {
        gender = value;
      });
    }
  }

  Future getImage(type) async {
    // final pickedFile = await picker.getImage(
    //     source: type == "Camera" ? ImageSource.camera : ImageSource.gallery);
    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //     setState(() {
    //       showAll = true;
    //     });
    //     Fluttertoast.showToast(
    //         msg: "Style has been uploaded.",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //   } else {
    //     print('No image selected.');
    //   }
    // });
  }

  List<Widget> yardsSize() {
    List<Widget> items = [];

    items.add(const SizedBox(
      height: 10,
    ));

    items.add(Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            fabric.name ?? "No Fabric Selected.",
            style: TextStyle(
              color: fabric.name != null ? Colors.black : Colors.red,
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    ));
    items.add(Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      color: Colors.white,
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Number of Yards(Min 4, Max 12)',
          labelStyle: TextStyle(
              color: Colors.black87, fontSize: 18, fontFamily: 'SegoeUi'),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0)),
        ),
        onChanged: (String val) {
          numberOfYards = double.parse(val);
        },
        inputFormatters: [DecimalTextInputFormatter(decimalRange: 1)],
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        //initialValue: numberOfYards.toString(),
        controller: _numberOfYardsCL,
        style: const TextStyle(
            color: Colors.black87, fontSize: 16, fontFamily: 'SegoeUi'),
      ),
    ));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
            "Customize",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CartPage(),
                  //   ),
                  // );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: primaryColor,
                )),
            // IconButton(
            //     onPressed: null,
            //     icon: Icon(
            //       Icons.more_horiz,
            //       color: Parameters.primaryColor,
            //     ))
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(
              FocusNode(),
            );
          },
          child: Container(
            height: size.height - kToolbarHeight - 24,
            //color: Color(0xFFE5E5E5),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cartItem(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      //pushToNewScreen(context);
                      // FabricGrid()
                      // showMaterialModalBottomSheet(
                      //     expand: true,
                      //     context: context,
                      //     backgroundColor: Colors.transparent,
                      //     builder: (context, scrollController) => FabricGrid());

                      // if (showFabricYards == false) {
                      //   setState(() {
                      //     showFabricYards = true;
                      //   });
                      // }
                    },
                    child: SizedBox(
                      height: collectionName == "Fabrics" ? 80 : 160,
                      child: Column(
                        children: [
                          collectionName == "Fabrics"
                              ? GestureDetector(
                                  onTap: () {
                                    //getImage()
                                    //_showPicker(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    height: 80,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _image == null
                                            ? Container(
                                                child: SvgPicture.asset(
                                                    "assets/images/fabric.svg",
                                                    color: Colors.red,
                                                    semanticsLabel:
                                                        'A red up arrow'))
                                            : CircleAvatar(
                                                radius: 20,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.file(
                                                    _image,
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Style",
                                                style: headingStyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                "Choose your preferred Style",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 14,
                                                    color: Color(0xFF686868)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                          collectionName != "Fabrics"
                              ? GestureDetector(
                                  onTap: () {
                                    pushToNewScreen(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    height: 80,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: SvgPicture.asset(
                                                "assets/images/fabric.svg",
                                                color: Colors.red,
                                                semanticsLabel:
                                                    'A red up arrow')),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Fabric",
                                                  style: headingStyle),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                "Choose your preferred Fabric",
                                                style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xFF686868),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                          collectionName != "Fabrics"
                              ? GestureDetector(
                                  onTap: () {
                                    // if (collectionName == "Men") {
                                    //   showFloatingModalBottomSheet(
                                    //     context: context,
                                    //     builder: (context, scrollController) =>
                                    //         MenMeasurementModal(
                                    //       type: menStyle,
                                    //       onSave: updateMeasurement,
                                    //     ),
                                    //   );
                                    // } else if (collectionName == "Women") {
                                    //   showFloatingModalBottomSheet(
                                    //     context: context,
                                    //     builder: (context, scrollController) =>
                                    //         WomenMeasurementModal(
                                    //       onSave: updateMeasurement,
                                    //     ),
                                    //   );
                                    // } else if (showAll && gender == "Male") {
                                    //   showFloatingModalBottomSheet(
                                    //     context: context,
                                    //     builder: (context, scrollController) =>
                                    //         MenMeasurementModal(
                                    //       type: menStyle,
                                    //       onSave: updateMeasurement,
                                    //     ),
                                    //   );
                                    // } else if (showAll && gender == "Female") {
                                    //   showFloatingModalBottomSheet(
                                    //     context: context,
                                    //     builder: (context, scrollController) =>
                                    //         WomenMeasurementModal(
                                    //       onSave: updateMeasurement,
                                    //     ),
                                    //   );
                                    // }
                                  },
                                  child: Container(
                                    height: 80,
                                    width: double.infinity,
                                    color: Colors.white,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/measurement.svg",
                                            //color: Colors.red,
                                            semanticsLabel: 'A red up arrow'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Measurement",
                                                style: headingStyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                "Choose your preferred Measurement",
                                                style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  fontSize: 14,
                                                  color: Color(0xFF686868),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  //additional if statement

                  ...yardsSize(),

                  const SizedBox(
                    height: 10,
                  ),

                  (collectionName == "Children")
                      ? const SizedBox(
                          height: 10,
                        )
                      : Container(),

                  (showAll)
                      ? Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Flexible(
                                child: RadioListTile(
                                  value: "Male",
                                  groupValue: gender,
                                  title: const Text("Male"),
                                  //subtitle: Text(user.lastName),
                                  onChanged: (value) {
                                    // print("Current User ${currentUser.firstName}");
                                    setSelectedGender(value);
                                  },
                                  selected: gender == "Male",
                                  activeColor: primaryColor,
                                ),
                              ),
                              Flexible(
                                child: RadioListTile(
                                  value: "Female",
                                  groupValue: gender,
                                  title: const Text("Female"),
                                  //subtitle: Text(user.lastName),
                                  onChanged: (value) {
                                    // print("Current User ${currentUser.firstName}");
                                    setSelectedGender(value);
                                  },
                                  selected: gender == "Female",
                                  activeColor: primaryColor,
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),

                  //Expanded(child: showMeasurement ? measurement() : Container()),
                  // collectionName == "Men"
                  //     ? MenTakenMeasurement(
                  //         type: menStyle,
                  //         measurementMen: measurementMen,
                  //         onEditFunction: openMeasurementForm,
                  //         showEditIcon: true,
                  //       )
                  //     : Container(),
                  // collectionName == "Women"
                  //     ? WomenTakenMeasurement(
                  //         measurementWomen: measurementWomen,
                  //         onEditFunction: openMeasurementForm,
                  //         showEditIcon: true,
                  //         type: womenStyle,
                  //       )
                  //     : Container(),
                  // (showAll && gender == "Male")
                  //     ? MenTakenMeasurement(
                  //         type: menStyle,
                  //         measurementMen: measurementMen,
                  //         onEditFunction: openMeasurementForm,
                  //         showEditIcon: true,
                  //       )
                  //     : Container(),
                  // (showAll && gender == "Female")
                  //     ? WomenTakenMeasurement(
                  //         measurementWomen: measurementWomen,
                  //         onEditFunction: openMeasurementForm,
                  //         showEditIcon: true,
                  //         type: womenStyle,
                  //       )
                  //     : Container(),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: Text(
                          "Dear Customer, Please note that Liberty Fashion will not be held responsible for any wrong order and measurement that you input on our fashion app. For any measurement or images that does not meet up to our requirements would imply a refund.",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                  //bottom()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
