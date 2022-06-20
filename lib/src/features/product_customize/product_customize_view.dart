import 'dart:convert';
import 'dart:io';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liberty_fashion/src/core/bloc/bloc.dart';
import 'package:liberty_fashion/src/core/constants/collection_name.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';
import 'package:liberty_fashion/src/core/widgets/decimal_text_input_formatter/decimal_text_input_formatter.dart';
import 'package:liberty_fashion/src/core/widgets/input_fields/liberty_fashion_text_field.dart';
import 'package:liberty_fashion/src/core/widgets/modals/liberty_fashion_modal.dart';
import 'package:liberty_fashion/src/features/cart/cart_view.dart';
import 'package:liberty_fashion/src/features/fabric_list/fabric_list.dart';
import 'package:liberty_fashion/src/features/men_measurement_modal/men_measurement_modal.dart';
import 'package:liberty_fashion/src/features/men_measurement_view/men_measurement_view.dart';
import 'package:liberty_fashion/src/features/product_customize/cart_item/cart_item.dart';
import 'package:liberty_fashion/src/features/product_customize/disclaimer_view/disclaimer_view.dart';
import 'package:liberty_fashion/src/features/product_customize/product_customize_view_actions_button/product_customize_view_actions_button.dart';
import 'package:liberty_fashion/src/features/women_measurement_modal/woman_measurement_modal.dart';
import 'package:liberty_fashion/src/features/women_measurement_view/women_measurement_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class ProductCustomizeView extends StatefulWidget {
  final ProductModel product;
  final CartModel? cart;
  final String collectionName;
  final String mode;

  const ProductCustomizeView({
    Key? key,
    required this.product,
    this.cart,
    required this.collectionName,
    required this.mode,
  }) : super(key: key);

  @override
  _ProductCustomizeViewState createState() => _ProductCustomizeViewState();
}

class _ProductCustomizeViewState extends State<ProductCustomizeView> {
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

  ProductModel fabric =
      ProductModel(createDate: DateTime.now().millisecondsSinceEpoch);

  final TextEditingController _numberOfYardsCL = TextEditingController();

  final CartBloc cartBloc = BlocProvider.getBloc<CartBloc>();

  double numberOfYards = 4.0;

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

    _numberOfYardsCL.text = numberOfYards.toString();

    if (mode == "New") {
      if (widget.collectionName == CollectionName.childrenCollectionName) {
        showAll = true;
      }
      if (widget.collectionName == CollectionName.womenCollectionName) {
        setState(() {
          gender = "Female";
        });
      }

      if (widget.collectionName == CollectionName.fabricCollectionName) {
        setState(() {
          fabric = product;
        });
      }

      loadMenMeasurement();
      loadWomenMeasurement();
    } else {
      _numberOfYardsCL.text = widget.cart!.fabricNoOfYards.toString();
      loadData();
    }
    super.initState();
  }

  void updateMeasurement() {
    loadMenMeasurement();
    loadWomenMeasurement();
  }

  void openMeasurementForm() {
    if (gender == "Male") {
      openMenMeasurementModal();
    } else {
      openWomenMeasurementModal();
    }
  }

  void openMenMeasurementModal() {
    LibertyFashionModal(
      child: MenMeasurementModal(
        type: menStyle,
        onSave: updateMeasurement,
      ),
      context: context,
    );
  }

  void openWomenMeasurementModal() {
    LibertyFashionModal(
      child: WomenMeasurementModal(
        type: womenStyle,
        onSave: updateMeasurement,
      ),
      context: context,
    );
  }

  void loadMenMeasurement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getString("measurementMen") != null) {
        Map<String, dynamic> item =
            json.decode(prefs.getString("measurementMen") ?? "");
        measurementMen.shoulder = item['shoulder'];
        measurementMen.sleeve = item['sleeve'];
        measurementMen.chest = item['chest'];
        measurementMen.topLength = item['topLength'];
        measurementMen.bicep = item['bicep'];
        measurementMen.wrist = item['wrist'];
        measurementMen.hip = item['hip'];
        measurementMen.trouserLength = item['trouserLength'];
        measurementMen.thigh = item['thigh'];
        measurementMen.trouserTip = item['trouserTip'];
        measurementMen.info = item['info'];
      }
    });
  }

  void loadWomenMeasurement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        if (prefs.getString("measurementWomen") != null) {
          Map<String, dynamic> item =
              json.decode(prefs.getString("measurementWomen") ?? "");
          measurementWomen.shoulder = item['shoulder'];
          measurementWomen.sleeve = item['sleeve'];
          measurementWomen.sleeveShortLength = item['sleeveShortLength'];
          measurementWomen.sleeve34Length = item['sleeve34Length'];
          measurementWomen.sleeveFullLength = item['sleeveFullLength'];
          measurementWomen.bust = item['bust'];
          measurementWomen.bustPoint = item['bustPoint'];
          measurementWomen.shoulderToUnderBust = item['shoulderToUnderBust'];
          measurementWomen.roundUnderBust = item['roundUnderBust'];
          measurementWomen.halfLength = item['halfLength'];
          measurementWomen.blouseWaist = item['blouseWaist'];
          measurementWomen.blouseLength = item['blouseLength'];
          measurementWomen.skirtWaist = item['skirtWaist'];
          measurementWomen.hips = item['hips'];
          measurementWomen.dressLength = item['dressLength'];
          measurementWomen.dress34Length = item['dress34Length'];
          measurementWomen.dressKneeLength = item['dressKneeLength'];
          measurementWomen.dressHalfLength = item['dressHalfLength'];
          measurementWomen.dressFloorLength = item['dressFloorLength'];
          measurementWomen.skirtLength = item['skirtLength'];
          measurementWomen.skirt34Length = item['skirt34Length'];
          measurementWomen.skirtKneeLength = item['skirtKneeLength'];
          measurementWomen.skirtShortLength = item['skirtShortLength'];
          measurementWomen.skirtFloorLength = item['skirtFloorLength'];
          measurementWomen.info = item['info'];
        }
      },
    );
  }

  void loadData() {
    if (widget.collectionName == CollectionName.childrenCollectionName) {
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
    if (widget.collectionName == CollectionName.womenCollectionName) {
      setState(() {
        gender = "Female";
      });
    }
    if (widget.collectionName == CollectionName.menCollectionName) {
      setState(() {
        gender = "Male";
      });
    }

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

  File? _image;
  //final picker = ImagePicker();

  void addToCart(
    ProductModel product,
  ) {
    if (fabric.name != '') {
      double a = numberOfYards * 2;
      double rounded = a.ceil() / 2;
      cartBloc.addToList(
        CartModel(
          id: uuid.v1(),
          product: product,
          fabric: fabric,
          collectionName: collectionName,
          fabricNoOfYards: rounded,
          menMeasurement: measurementMen,
          womenMeasurement: measurementWomen,
          menStyle: menStyle,
          womenStyle: womenStyle,
          gender: gender,
        ),
      );
      showToast("Product has been successfully added to your cart");
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void pushToNewScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FabricList(
          selectedId: fabric.id ?? "",
        ),
      ),
    ).then((value) {
      // if value is true you get the result as bool else no result
      if (value != null) {
        setState(() {
          fabric = value;
        });
      } else {
        logger.i('Do nothing');
      }
    });
  }

  // void _showPicker(context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext bc) {
  //       return SafeArea(
  //         child: SizedBox(
  //           child: Wrap(
  //             children: <Widget>[
  //               ListTile(
  //                 leading: const Icon(Icons.photo_library),
  //                 title: const Text('Photo Library'),
  //                 onTap: () {
  //                   getImage("Gallery");
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //               ListTile(
  //                 leading: const Icon(Icons.photo_camera),
  //                 title: const Text('Camera'),
  //                 onTap: () {
  //                   getImage("Camera");
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //}

  void setSelectedGender(value) {
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
    //     logger.i('No image selected.');
    //   }
    // });
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: primaryColor,
              ),
            ),
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartItem(
                    collectionName: collectionName,
                    fabric: fabric,
                    product: product,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height:
                        collectionName == CollectionName.fabricCollectionName
                            ? 80
                            : 160,
                    child: Column(
                      children: [
                        collectionName == CollectionName.fabricCollectionName
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
                                          ? SvgPicture.asset(
                                              "assets/images/fabric.svg",
                                              color: Colors.red,
                                              semanticsLabel: 'A red up arrow')
                                          : CircleAvatar(
                                              radius: 20,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.file(
                                                  _image!,
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
                        collectionName != CollectionName.fabricCollectionName
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
                                      SvgPicture.asset(
                                          "assets/images/fabric.svg",
                                          color: Colors.red,
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
                                            Text("Fabric", style: headingStyle),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Choose your preferred Fabric",
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
                        collectionName != CollectionName.fabricCollectionName
                            ? GestureDetector(
                                onTap: () {
                                  logger.i("collectionName: $collectionName");
                                  if (collectionName ==
                                      CollectionName.menCollectionName) {
                                    openMenMeasurementModal();
                                  } else if (collectionName ==
                                      CollectionName.womenCollectionName) {
                                    openWomenMeasurementModal();
                                  } else if (showAll && gender == "Male") {
                                    openMenMeasurementModal();
                                  } else if (showAll && gender == "Female") {
                                    openWomenMeasurementModal();
                                  }
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
                  //Fabric measurement section
                  ...[
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            fabric.name != ''
                                ? fabric.name
                                : "No Fabric Selected.",
                            style: TextStyle(
                              color:
                                  fabric.name != '' ? Colors.black : Colors.red,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      color: Colors.white,
                      child: LibertyFashionTextField(
                        controller: _numberOfYardsCL,
                        labelText: 'Number of Yards(Min 4, Max 12)',
                        labelStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'SegoeUi'),
                        onChanged: (String val) {
                          try {
                            numberOfYards = double.parse(val);
                          } catch (e) {
                            logger.e(e);
                          }
                        },
                        inputFormatters: [
                          DecimalTextInputFormatter(decimalRange: 1)
                        ],
                        textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontFamily: 'SegoeUi'),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                  (collectionName == CollectionName.childrenCollectionName)
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
                                  onChanged: (value) {
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
                                  onChanged: (value) {
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
                  collectionName == CollectionName.menCollectionName
                      ? MenMeasurementView(
                          type: menStyle,
                          measurementMen: measurementMen,
                          onEditFunction: openMeasurementForm,
                          showEditIcon: true,
                        )
                      : Container(),
                  collectionName == CollectionName.womenCollectionName
                      ? WomenMeasurementView(
                          measurementWomen: measurementWomen,
                          onEditFunction: openMeasurementForm,
                          showEditIcon: true,
                          type: womenStyle,
                        )
                      : Container(),
                  (showAll && gender == "Male")
                      ? MenMeasurementView(
                          type: menStyle,
                          measurementMen: measurementMen,
                          onEditFunction: openMeasurementForm,
                          showEditIcon: true,
                        )
                      : Container(),
                  (showAll && gender == "Female")
                      ? WomenMeasurementView(
                          measurementWomen: measurementWomen,
                          onEditFunction: openMeasurementForm,
                          showEditIcon: true,
                          type: womenStyle,
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  const DisclaimerView(),
                  const SizedBox(
                    height: 10,
                  ),
                  ProductCustomizeViewActionsButton(
                    addToCart: addToCart,
                    collectionName: collectionName,
                    fabric: fabric,
                    mode: mode,
                    numberOfYards: numberOfYards,
                    product: product,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
