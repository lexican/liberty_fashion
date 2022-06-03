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
              borderRadius:
                  outline ? BorderRadius.circular(4) : BorderRadius.zero,
              side: BorderSide(
                  color: outline ? primaryColor : Colors.transparent)),
        ),
        backgroundColor:
            MaterialStateProperty.all(buttonBackgroundColor ?? primaryColor),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: buttonTextFontSize ?? 18,
          color: buttonTextColor ?? Colors.white,
          fontFamily: "SegoeUi",
        ),
      ),
      onPressed: onPressed,
    );
  }
}
