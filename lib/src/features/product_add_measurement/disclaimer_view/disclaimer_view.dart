import 'package:flutter/material.dart';

class DisclaimerView extends StatelessWidget {
  const DisclaimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Flexible(
          child: Text(
            "Dear Customer, Please note that Liberty Fashion will not be held responsible for any wrong order and measurement that you input on our fashion app. For any measurement or images that does not meet up to our requirements would imply a refund.",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
