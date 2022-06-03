import 'package:flutter/material.dart';

class LibertyFashionTextField extends StatelessWidget {
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const LibertyFashionTextField(
      {Key? key,
      this.labelText,
      this.labelStyle,
      this.controller,
      this.textStyle,
      this.onChanged,
      this.keyboardType,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ??
            const TextStyle(
                color: Colors.black87, fontSize: 16, fontFamily: 'SegoeUi'),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0)),
      ),
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      style: textStyle ??
          const TextStyle(
              color: Colors.black87, fontSize: 14, fontFamily: 'SegoeUi'),
      validator: validator,
    );
  }
}
