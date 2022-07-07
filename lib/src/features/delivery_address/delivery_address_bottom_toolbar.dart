import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';

class DeliveryAddressBottomToolbar extends StatelessWidget {
  final bool isGeneratingCode;
  final double total;
  final Function() validateAndSubmit;
  const DeliveryAddressBottomToolbar({
    Key? key,
    required this.isGeneratingCode,
    required this.total,
    required this.validateAndSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "VAT",
                style: TextStyle(fontSize: 18, color: Color(0xFF686868)),
              ),
              Text(
                "5%",
                style: TextStyle(fontSize: 18, color: Color(0xFF686868)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal: ",
                style: TextStyle(fontSize: 18, color: primaryColor),
              ),
              Text(
                "\u20A6 ${moneyFormat(total.toInt().toString())}",
                style: const TextStyle(
                  color: Color(0xFF686868),
                  fontSize: 18,
                  //fontWeight: FontWeight.w800
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: const BorderSide(color: Colors.red)),
                  color: primaryColor,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () {
                    //Navigator.pop(context);
                    validateAndSubmit();
                  },
                  child: Text(
                    isGeneratingCode ? "Processing.." : "Pay Now".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
