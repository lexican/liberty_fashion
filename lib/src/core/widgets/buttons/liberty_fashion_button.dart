import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/utils/app_utils.dart';

class LibertyFashionButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final Color? buttonTextColor;
  final Color? buttonBackgroundColor;
  final double? buttonTextFontSize;
  final bool outline;
  const LibertyFashionButton(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      this.buttonTextColor,
      this.buttonBackgroundColor,
      this.buttonTextFontSize,
      this.outline = false})
      : super(key: key);

  const LibertyFashionButton.outline(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      this.buttonTextColor,
      this.buttonBackgroundColor,
      this.buttonTextFontSize,
      this.outline = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: outline ? primaryColor : Colors.transparent)),
        ),
        backgroundColor: outline
            ? MaterialStateProperty.all(Colors.transparent)
            : MaterialStateProperty.all(buttonBackgroundColor ?? primaryColor),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: buttonTextFontSize ?? 18,
            color: buttonTextColor ?? Colors.white,
            fontFamily: "SegoeUi",
          ),
        ),
      ),
    );
  }
}
