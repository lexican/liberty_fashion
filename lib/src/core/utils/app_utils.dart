import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

const constpadding = EdgeInsets.only(left: 30, right: 30);
const Color primaryColor = Color(0xffC2128D);
const Color cGrey = Color(0xff717171);
const Color backgroundColor = Color(0xffE5E5E5);
const Color primaryColorLight = Color(0xffed93d2);

Widget dividerContainer({height = 0.5, width = 0.0, color = Colors.grey}) {
  return Container(height: height, width: width, color: color);
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

String moneyFormat(String price) {
  if (price.length > 2) {
    var value = price;
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return value;
  }
  return price;
}

String validateEmail(String value) {
  RegExp regex =
      RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$");
  if (!regex.hasMatch(value) || value.isEmpty) {
    return 'Enter a valid email address';
  } else {
    return '';
  }
}

bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }
  return double.tryParse(s) != null;
}

String validateText(value, fieldName) {
  if (value.isEmpty) {
    return '$fieldName is required';
  }
  return '';
}

String validatePhoneNumber(String value) {
  if (value.length != 11) {
    return 'Mobile Number must be of 10 digit';
  }
  RegExp regex = RegExp(r"^[0]\d{10}$");
  if (!regex.hasMatch(value)) {
    return 'Enter a valid phone number';
  } else {
    return '';
  }
}

void showToast(String message, {Color? backgroundColor}) {
  Fluttertoast.showToast(
      msg: "No Fabric selected",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

final logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      lineLength: 140,
      colors: true,
      printEmojis: true,
      printTime: true),
);
