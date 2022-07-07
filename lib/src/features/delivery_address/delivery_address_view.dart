import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liberty_fashion/src/core/bloc/bloc.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';
import 'package:liberty_fashion/src/core/widgets/input_fields/liberty_fashion_text_field.dart';
import 'package:liberty_fashion/src/features/delivery_address/delivery_address_bottom_toolbar.dart';
import 'package:liberty_fashion/src/features/delivery_address/location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryAddressView extends StatefulWidget {
  const DeliveryAddressView({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressView> createState() => _DeliveryAddressViewState();
}

class _DeliveryAddressViewState extends State<DeliveryAddressView>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  bool keepAlive = false;

  LocationModel? selectedLocation;

  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _phoneNumber = "";

  List<LocationModel> locations = [];

  final CartTotalBloc blocTotal = BlocProvider.getBloc<CartTotalBloc>();
  final CartBloc bloc = BlocProvider.getBloc<CartBloc>();

  var publicKey = 'pk_test_741153c540ee9bb4f992e7e55d5bc4a44e6aaefe';
  var sk_test = "sk_test_bcf2323f9c4cb0924d73923de15e7e3db488ee05";
  bool isGeneratingCode = false;

  double total = 0.0;
  double deliveryFee = 0.0;

  late SharedPreferences sharedPreferences;

  List<ProductModel> items = [];

  final TextEditingController _firstNamecontroller = TextEditingController();
  final TextEditingController _lastNamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _phoneNumbercontroller = TextEditingController();

  StreamSubscription? cartTotalSubscription;
  // late StreamSubscription subscription2;

  // final paystackPlugin = PaystackPlugin();

  bool _disposed = false;

  @override
  void initState() {
    super.initState();

    // paystackPlugin.initialize(publicKey: publicKey);

    locations.add(const LocationModel("1", "Mile 2", 2000));
    locations.add(const LocationModel("2", "CMS", 1700));
    locations.add(const LocationModel("3", "Orile", 1800));
    locations.add(const LocationModel("4", "Surulere", 2000));
    locations.add(const LocationModel("5", "Lekki", 2200));
    locations.add(const LocationModel("6", "Ikeja", 2100));

    logger.i("Address init called");

    keepAlive = true;
    updateKeepAlive();
    loadData();
    keepAlive = false;
    updateKeepAlive();
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    form?.save();
    if (form!.validate()) {
      logger.i("Valid form");
      return true;
    } else {
      logger.i("Invalid form");
      return false;
    }
  }

  void validateAndSubmit() async {
    final form = _formKey.currentState;
    form?.save();
    if (validateAndSave()) {
      if (selectedLocation != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('_firstName', _firstName);
        await prefs.setString('_lastName', _lastName);
        await prefs.setString('email', _email);
        await prefs.setString('phoneNumber', _phoneNumber);
        await prefs.remove("selectedLocation");
        await prefs.setString(
            'selectedLocation', json.encode(selectedLocation?.toJson()));

        logger.i(prefs.getString('_firstName') ?? "");
        logger.i(prefs.getString('_lastName') ?? "");
        logger.i(prefs.getString('email') ?? "");
        logger.i(prefs.getString('phoneNumber') ?? "");
        logger.i(prefs.getString("selectedLocation") ?? "");
        //chargeCard(total.toInt());
      } else {
        Fluttertoast.showToast(
            msg: "Choose a location",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(
      () {
        if (prefs.getString('_firstName') != null) {
          _firstNamecontroller.text = prefs.getString('_firstName') ?? '';
        }

        if (prefs.getString('_lastName') != null) {
          _lastNamecontroller.text = prefs.getString('_lastName') ?? '';
        }

        if (prefs.getString('email') != null) {
          _emailcontroller.text = prefs.getString('email') ?? '';
        }

        if (prefs.getString('phoneNumber') != null) {
          _phoneNumbercontroller.text = prefs.getString('phoneNumber') ?? '';
        }

        if (prefs.getString("selectedLocation") != null) {
          Map<String, dynamic> item =
              json.decode(prefs.getString("selectedLocation") ?? '');
          logger.i("item['id']: " + item['id']);
          logger.i("item['name']: " + item['name']);
          logger.i("item['amount']: ${item['amount']}");
          selectedLocation =
              LocationModel(item['id'], item['name'], item['amount']);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        centerTitle: true,
        title: const Text(
          "Delivery Address",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: primaryColor,
            ),
          )
        ],
      ),
      body: Container(
        height: size.height,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                LibertyFashionTextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String val) {
                    _email = val;
                  },
                  validator: (val) {
                    return validateEmail(val ?? '');
                  },
                  controller: _emailcontroller,
                  labelText: "Email",
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String val) {
                    _firstName = val;
                  },
                  validator: (val) {
                    return validateText(val, "First Name");
                  },
                  controller: _firstNamecontroller,
                  labelText: "First Name",
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.number,
                  controller: _phoneNumbercontroller,
                  onChanged: (String val) {
                    _lastName = val;
                  },
                  validator: (val) {
                    return validateText(val, "Last Name");
                  },
                  labelText: "Last Name",
                ),
                LibertyFashionTextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String val) {
                    _phoneNumber = val;
                  },
                  validator: (val) {
                    return validatePhoneNumber(val ?? '');
                  },
                  controller: _lastNamecontroller,
                  labelText: "Phone Number",
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Listener(
                        onPointerDown: (_) => FocusScope.of(context).unfocus(),
                        child: DropdownButton<LocationModel>(
                          value: locations.isNotEmpty ? selectedLocation : null,
                          isDense: false,
                          isExpanded: true,
                          onChanged: (LocationModel? val) {
                            if (val != null) {
                              setState(() {
                                selectedLocation = val;
                              });
                            }
                          },
                          hint: Text(
                            selectedLocation != null
                                ? selectedLocation!.name
                                : "Choose Location",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          items: locations.map((LocationModel location) {
                            logger.i("id: ${location.id}");
                            return DropdownMenuItem<LocationModel>(
                              onTap: (() => {
                                    setState(() {
                                      deliveryFee = location.amount.toDouble();
                                    })
                                  }),
                              value: location,
                              child: Text(
                                location.name,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                DeliveryAddressBottomToolbar(
                  total: total + deliveryFee,
                  isGeneratingCode: isGeneratingCode,
                  validateAndSubmit: validateAndSubmit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Stream stream = blocTotal.outCartTotal;
    cartTotalSubscription?.cancel();

    if (!_disposed) {
      cartTotalSubscription = stream.listen((value) {
        setState(() {
          total = value;
        });
      });
    }

    // Stream stream2 = bloc.cartListStream;
    // subscription2.cancel();
    // if (!_disposed) {
    //   subscription2 = stream2.listen((value) {
    //     setState(() {
    //       items = value;
    //     });
    //   });
    // }
  }

  @override
  void dispose() {
    _disposed = true;
    // subscription.cancel();
    // subscription2.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => keepAlive;
}
