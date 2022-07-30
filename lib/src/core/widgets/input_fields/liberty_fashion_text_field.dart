import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LibertyFashionTextField extends StatelessWidget {
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Function? setObscureText;
  final bool isPassword;
  const LibertyFashionTextField({
    Key? key,
    this.labelText,
    this.labelStyle,
    this.controller,
    this.textStyle,
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.obscureText = false,
    this.setObscureText,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  if (setObscureText != null) {
                    setObscureText!();
                  }
                },
              )
            : const SizedBox(),
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
      inputFormatters: inputFormatters,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      style: textStyle ??
          const TextStyle(
              color: Colors.black87, fontSize: 14, fontFamily: 'SegoeUi'),
      validator: validator,
      obscureText: obscureText,
    );
  }
}
