import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/bloc/bloc.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';

class CartItemBottomToolbar extends StatelessWidget {
  const CartItemBottomToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartTotalBloc blocTotal = BlocProvider.getBloc<CartTotalBloc>();
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
            children: [
              const Text(
                "Subtotal: ",
                style: TextStyle(fontSize: 18, color: primaryColor),
              ),
              StreamBuilder(
                stream: blocTotal.outCartTotal,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    "\u20A6" + moneyFormat(snapshot.data.toString()),
                    style: const TextStyle(
                      color: Color(0xFF686868),
                      fontSize: 18,
                      //fontWeight: FontWeight.w800
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: const BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LandingPage()),
                    // );
                  },
                  color: Colors.white,
                  textColor: primaryColor,
                  child: Text(
                    "CONTINUE SHOPPING".toUpperCase(),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: const BorderSide(color: Colors.red)),
                  color: primaryColor,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AddressPage(),),);
                  },
                  child: Text(
                    "BUY".toUpperCase(),
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
