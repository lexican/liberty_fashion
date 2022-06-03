import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/widgets/buttons/liberty_fashion_button.dart';
import 'package:liberty_fashion/src/core/widgets/input_fields/liberty_fashion_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/models/models.dart';
import '../../core/utils/utils.dart';

class WomenMeasurementModal extends StatefulWidget {
  final Function() onSave;
  final String type;
  const WomenMeasurementModal(
      {Key? key, required this.onSave, required this.type})
      : super(key: key);

  @override
  _WomenMeasurementModalState createState() => _WomenMeasurementModalState();
}

class _WomenMeasurementModalState extends State<WomenMeasurementModal> {
  final _formKey = GlobalKey<FormState>();
  WomenMeasurementModel measurementWomen = WomenMeasurementModel();

  final TextEditingController _shoulderWn = TextEditingController();

  final TextEditingController _sleeveWn = TextEditingController();

  final TextEditingController _sleeveshortWn = TextEditingController();
  final TextEditingController _sleeve34Wn = TextEditingController();
  final TextEditingController _sleeveLongWn = TextEditingController();

  final TextEditingController _bustWn = TextEditingController();
  final TextEditingController _bustPointWn = TextEditingController();

  final TextEditingController _shoulderToUnderBustWn = TextEditingController();
  final TextEditingController _roundUnderBustWn = TextEditingController();

  final TextEditingController _halfLengthWn = TextEditingController();
  final TextEditingController _blouseWaistWn = TextEditingController();

  final TextEditingController _blouseLengthWn = TextEditingController();

  final TextEditingController _skirtWaistWn = TextEditingController();
  final TextEditingController _hipsWn = TextEditingController();

  //final TextEditingController _dressLengthWn = TextEditingController();

  final TextEditingController _dresskneeLengthWn = TextEditingController();
  final TextEditingController _dress34LengthWn = TextEditingController();
  final TextEditingController _dressfloorLengthWn = TextEditingController();
  final TextEditingController _dress12LengthWn = TextEditingController();

  //final TextEditingController _skirtLengthWn = TextEditingController();

  final TextEditingController _skirtShortLengthWn = TextEditingController();
  final TextEditingController _skirtLongLengthWn = TextEditingController();
  final TextEditingController _skirt34LengthWn = TextEditingController();
  final TextEditingController _skirtKneeLengthWn = TextEditingController();

  final TextEditingController _info = TextEditingController();

  late String type;

  @override
  void initState() {
    super.initState();
    type = widget.type;
    loadWomenMeasurement();
  }

  void loadWomenMeasurement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
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

        _shoulderWn.text = item['shoulder'].toString();

        _sleeveWn.text = item['sleeve'].toString();

        _sleeve34Wn.text = item['sleeve34Length'].toString();
        _sleeveLongWn.text = item['sleeveFullLength'].toString();
        _sleeveshortWn.text = item['sleeveShortLength'].toString();

        _bustWn.text = item['bust'].toString();

        _bustPointWn.text = item['bustPoint'].toString();

        _shoulderToUnderBustWn.text = item['shoulderToUnderBust'].toString();
        _roundUnderBustWn.text = item['roundUnderBust'].toString();
        _halfLengthWn.text = item['halfLength'].toString();
        _blouseWaistWn.text = item['blouseWaist'].toString();
        _blouseLengthWn.text = item['blouseLength'].toString();

        _skirtWaistWn.text = item['skirtWaist'].toString();
        _hipsWn.text = item['hips'].toString();

        _hipsWn.text = item['hips'].toString();

        _dresskneeLengthWn.text = item['dressKneeLength'].toString();
        _dress34LengthWn.text = item['dress34Length'].toString();
        _dressfloorLengthWn.text = item['dressFloorLength'].toString();
        _dress12LengthWn.text = item['dressHalfLength'].toString();

        _skirt34LengthWn.text = item['skirt34Length'].toString();
        _skirtKneeLengthWn.text = item['skirtKneeLength'].toString();
        _skirtShortLengthWn.text = item['skirtShortLength'].toString();
        _skirtLongLengthWn.text = item['skirtFloorLength'].toString();

        _info.text = item['info'];
      }
    });
  }

  void validateAndSubmitWomenMeasurement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      await prefs.setString(
          'measurementWomen', json.encode(measurementWomen.toJson()));
      widget.onSave();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Shoulder(in)',
                controller: _shoulderWn,
                onChanged: (String val) {
                  measurementWomen.shoulder = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Sleeve Short Length(in)',
                controller: _sleeveshortWn,
                onChanged: (String val) {
                  measurementWomen.sleeveShortLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Sleeve 3/4 Length(in)',
                controller: _sleeve34Wn,
                onChanged: (String val) {
                  measurementWomen.sleeve34Length = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Sleeve Long/Full Length(in)',
                controller: _sleeveLongWn,
                onChanged: (String val) {
                  measurementWomen.sleeveFullLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Bust(in)',
                controller: _bustWn,
                onChanged: (String val) {
                  measurementWomen.bust = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Bust Point(in)',
                controller: _bustPointWn,
                onChanged: (String val) {
                  measurementWomen.bustPoint = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Shoulder To Under Bust(in)',
                controller: _shoulderToUnderBustWn,
                onChanged: (String val) {
                  measurementWomen.shoulderToUnderBust = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Round Under Bust(in)',
                controller: _roundUnderBustWn,
                onChanged: (String val) {
                  measurementWomen.roundUnderBust = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Half Length',
                controller: _halfLengthWn,
                onChanged: (String val) {
                  measurementWomen.halfLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Blouse Waist(in)',
                controller: _blouseWaistWn,
                onChanged: (String val) {
                  measurementWomen.blouseWaist = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }
    if (type == "Regular" || type == "Top" || type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Blouse Length(in)',
                controller: _blouseLengthWn,
                onChanged: (String val) {
                  measurementWomen.blouseLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }

    if (type == "Regular" || type == "Skirt") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Skirt Waist(in)',
                controller: _skirtWaistWn,
                onChanged: (String val) {
                  measurementWomen.skirtWaist = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }
    if (type == "Regular" || type == "Skirt") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Hips(in)',
                controller: _hipsWn,
                onChanged: (String val) {
                  measurementWomen.hips = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }

    if (type == "Regular" || type == "Dresses" || type == "JumpSuit") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Dress Half Length(in)',
                controller: _dress12LengthWn,
                onChanged: (String val) {
                  measurementWomen.dressHalfLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Dress Knee Length(in)',
                controller: _dresskneeLengthWn,
                onChanged: (String val) {
                  measurementWomen.dressKneeLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Dress 3/4 Length(in)',
                controller: _dress34LengthWn,
                onChanged: (String val) {
                  measurementWomen.dress34Length = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Dress Floor Length(in)',
                controller: _dressfloorLengthWn,
                onChanged: (String val) {
                  measurementWomen.dressFloorLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }
    if (type == "Regular" || type == "Skirt") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Skirt Short Length(in)',
                controller: _skirtShortLengthWn,
                onChanged: (String val) {
                  measurementWomen.skirtShortLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Skirt Knee Length(in)',
                controller: _skirtKneeLengthWn,
                onChanged: (String val) {
                  measurementWomen.skirtKneeLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Skirt 3/4 Length(in)',
                controller: _skirt34LengthWn,
                onChanged: (String val) {
                  measurementWomen.skirt34Length = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextField(
                labelText: 'Skirt Long Length(in)',
                controller: _skirtLongLengthWn,
                onChanged: (String val) {
                  measurementWomen.skirtFloorLength = double.parse(val);
                },
                keyboardType: TextInputType.number,
                validator: (val) =>
                    isNumeric(val ?? "") ? null : "Invalid measurement",
              ),
            ),
          ],
        ),
      );
    }
    items.add(
      Row(
        children: [
          Expanded(
            child: LibertyFashionTextField(
              labelText: "Additional Information",
              controller: _info,
              onChanged: (String val) {
                measurementWomen.info = val;
              },
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            title: const Text(
              "Female Measurement",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          // margin: EdgeInsets.only(top: 20),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Material(
              color: Colors.white,
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: AnimatedPadding(
                    padding: MediaQuery.of(context).viewInsets,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.decelerate,
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        ...items,
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Center(
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: LibertyFashionButton(
                                  buttonText: 'Save',
                                  onPressed: validateAndSubmitWomenMeasurement,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
