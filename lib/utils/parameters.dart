import 'package:flutter/material.dart';

class Parameters {
  static const constpadding = EdgeInsets.only(left: 30, right: 30);
  static const Color primaryColor = Color(0xffC2128D);
  static const Color cGrey = Color(0xff717171);
  static const Color backgroundColor = Color(0xffE5E5E5);
  static const Color primaryColorLight = Color(0xffed93d2);
  static Widget dividerContainer(
      {height = 0.5, width = 0.0, color = Colors.grey}) {
    return Container(height: height, width: width, color: color);
  }

  static String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return price;
  }

  static String validateEmail(String value) {
    RegExp regex =
        RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$");
    if (!regex.hasMatch(value) || value.isEmpty)
      return 'Enter a valid email address';
    else
      return '';
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static String validateText(value, fieldName) {
    if (value.isEmpty) {
      return '$fieldName is required';
    }
    return '';
  }

  static String validatePhoneNumber(String value) {
    if (value.length != 11) {
      return 'Mobile Number must be of 10 digit';
    }
    RegExp regex = new RegExp(r"^[0]\d{10}$");
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid phone number';
    else
      return '';
  }
}
