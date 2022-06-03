import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';
import 'package:liberty_fashion/src/core/widgets/input_fields/liberty_fashion_text_field_with_label.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenMeasurementModal extends StatefulWidget {
  final Function() onSave;
  final String type;
  const MenMeasurementModal(
      {Key? key, required this.onSave, required this.type})
      : super(key: key);

  @override
  _MenMeasurementModalState createState() => _MenMeasurementModalState();
}

class _MenMeasurementModalState extends State<MenMeasurementModal> {
  final _formKey = GlobalKey<FormState>();
  MenMeasurementModel measurementMen = MenMeasurementModel();

  final TextEditingController _shoulder = TextEditingController();
  final TextEditingController _sleeve = TextEditingController();
  final TextEditingController _chest = TextEditingController();
  final TextEditingController _topLength = TextEditingController();
  final TextEditingController _bicep = TextEditingController();
  final TextEditingController _wrist = TextEditingController();
  final TextEditingController _waist = TextEditingController();
  final TextEditingController _hip = TextEditingController();
  final TextEditingController _trouserLength = TextEditingController();
  final TextEditingController _thigh = TextEditingController();
  final TextEditingController _trouserTip = TextEditingController();

  final TextEditingController _info = TextEditingController();

  final TextStyle labelStyle = const TextStyle(
      color: Colors.black87, fontSize: 16, fontFamily: 'SegoeUi');
  final textStyle = const TextStyle(
      color: Colors.black87, fontSize: 14, fontFamily: 'SegoeUi');

  late String type;
  late String info;

  @override
  void initState() {
    super.initState();
    type = widget.type;
    loadMenMeasurement();
  }

  void validateAndSubmitMenMeasurement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      await prefs.setString(
          'measurementMen', json.encode(measurementMen.toJson()));
      widget.onSave();
      Navigator.pop(context);
    }
  }

  void loadMenMeasurement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getString("measurementMen") != null) {
        Map<String, dynamic> item =
            json.decode(prefs.getString("measurementMen") ?? "");

        //print("item: ${item}");

        measurementMen.shoulder = item['shoulder'];
        measurementMen.sleeve = item['sleeve'];
        measurementMen.chest = item['chest'];
        measurementMen.topLength = item['topLength'];

        measurementMen.bicep = item['bicep'];
        measurementMen.wrist = item['wrist'];

        measurementMen.waist = item['waist'];

        measurementMen.hip = item['hip'];
        measurementMen.trouserLength = item['trouserLength'];
        measurementMen.thigh = item['thigh'];
        measurementMen.trouserTip = item['trouserTip'];

        measurementMen.info = item['info'];

        _shoulder.text =
            item['shoulder'] != null ? item['shoulder'].toString() : "0";
        _sleeve.text = item['sleeve'] != null ? item['sleeve'].toString() : "0";
        _chest.text = item['chest'] != null ? item['chest'].toString() : "0";
        _topLength.text =
            item['topLength'] != null ? item['topLength'].toString() : "0";

        _bicep.text = item['bicep'] != null ? item['bicep'].toString() : "0";
        _wrist.text = item['wrist'] != null ? item['wrist'].toString() : "0";

        _wrist.text = item['waist'] != null ? item['waist'].toString() : "0";

        _hip.text = item['hip'] != null ? item['hip'].toString() : "0";

        _trouserLength.text = item['trouserLength'] != null
            ? item['trouserLength'].toString()
            : "0";
        _thigh.text = item['thigh'] != null ? item['thigh'].toString() : "0";
        _trouserTip.text =
            item['trouserTip'] != null ? item['trouserTip'].toString() : "0";

        _info.text = item['info'] ?? "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    if (type == "Regular" || type == "Top") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Shoulder(in)',
                controller: _shoulder,
                onChanged: (String val) {
                  measurementMen.shoulder = double.parse(val);
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
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Sleeve(in)',
                controller: _sleeve,
                onChanged: (String val) {
                  measurementMen.sleeve = double.parse(val);
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
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Chest(in)',
                controller: _chest,
                onChanged: (String val) {
                  measurementMen.chest = double.parse(val);
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
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Top Length(in)',
                controller: _topLength,
                onChanged: (String val) {
                  measurementMen.topLength = double.parse(val);
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
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Bicep(in)',
                controller: _bicep,
                onChanged: (String val) {
                  measurementMen.bicep = double.parse(val);
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
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Wrist(in)',
                controller: _wrist,
                onChanged: (String val) {
                  measurementMen.wrist = double.parse(val);
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
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Waist(in)',
                controller: _waist,
                onChanged: (String val) {
                  measurementMen.waist = double.parse(val);
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

    if (type == "Regular" || type == "Trouser") {
      items.add(
        Row(
          children: [
            Expanded(
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Trouser Length(in)',
                controller: _trouserLength,
                onChanged: (String val) {
                  measurementMen.trouserLength = double.parse(val);
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
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Thigh(in)',
                controller: _thigh,
                onChanged: (String val) {
                  measurementMen.thigh = double.parse(val);
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
              child: LibertyFashionTextFieldWithLabel(
                labelText: 'Trouser Tip(in)',
                controller: _trouserTip,
                onChanged: (String val) {
                  measurementMen.trouserTip = double.parse(val);
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
            child: LibertyFashionTextFieldWithLabel(
              labelText: "Additional Information",
              controller: _info,
              onChanged: (String val) {
                measurementMen.info = val;
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
              "Male Measurement",
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
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: FlatButton(
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: "SegoeUi",
                                    ),
                                  ),
                                  onPressed: validateAndSubmitMenMeasurement,
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
