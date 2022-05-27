import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';

import '../../core/models/models.dart';

class WomenMeasurementView extends StatelessWidget {
  final WomenMeasurementModel measurementWomen;
  const WomenMeasurementView(
      {Key? key,
      required this.measurementWomen,
      required this.onEditFunction,
      required this.showEditIcon,
      this.type})
      : super(key: key);
  final TextStyle headingStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500);

  final TextStyle meansurementStyle = const TextStyle(
      fontFamily: "SegoeUi", fontSize: 14, fontWeight: FontWeight.w600);

  final VoidCallback onEditFunction;

  final bool showEditIcon;
  final height = 10.0;
  final type;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    print("Top" == type);

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Shoulder:",
              style: TextStyle(fontFamily: "SegoeUi", fontSize: 14),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              (measurementWomen.shoulder != null
                      ? measurementWomen.shoulder.toString()
                      : "0") +
                  " in",
              style: meansurementStyle,
            ),
          ],
        ),
      );
    }

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        SizedBox(
          height: height,
        ),
      );
    }

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      // items.add(Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Text("Sleeve:",
      //         style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     Text(
      //         (measurementWomen.sleeve != null
      //                 ? measurementWomen.sleeve.toString()
      //                 : "0") +
      //             " in",
      //         style: meansurementStyle)
      //   ],
      // ));
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Short Sleeve Length:",
              style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
          const SizedBox(
            width: 10,
          ),
          Text(
              (measurementWomen.sleeveShortLength != null
                      ? measurementWomen.sleeveShortLength.toString()
                      : "0") +
                  " in",
              style: meansurementStyle)
        ],
      ));
      items.add(
        SizedBox(
          height: height,
        ),
      ); 
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("3/4 Sleeve Length:",
              style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
          const SizedBox(
            width: 10,
          ),
          Text(
              (measurementWomen.sleeve34Length != null
                      ? measurementWomen.sleeve34Length.toString()
                      : "0") +
                  " in",
              style: meansurementStyle)
        ],
      ));
      items.add(
        SizedBox(
          height: height,
        ),
      );
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Long/Full Sleeve Length:",
              style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
          const SizedBox(
            width: 10,
          ),
          Text(
              (measurementWomen.sleeveFullLength != null
                      ? measurementWomen.sleeveFullLength.toString()
                      : "0") +
                  " in",
              style: meansurementStyle)
        ],
      ));
    }

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(SizedBox(
        height: height,
      ));
    }

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Bust:",
              style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
          const SizedBox(
            width: 10,
          ),
          Text(
              (measurementWomen.bust != null
                      ? measurementWomen.bust.toString()
                      : "0") +
                  " in",
              style: meansurementStyle)
        ],
      ));
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(SizedBox(
        height: height,
      ));
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Bust Point:",
              style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
          const SizedBox(
            width: 10,
          ),
          Text(
              (measurementWomen.bustPoint != null
                      ? measurementWomen.bustPoint.toString()
                      : "0") +
                  " in",
              style: meansurementStyle)
        ],
      ));
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(SizedBox(
        height: height,
      ));
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Shoulder To Under Bust:",
              style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
          const SizedBox(
            width: 10,
          ),
          Text(
              (measurementWomen.shoulderToUnderBust != null
                      ? measurementWomen.shoulderToUnderBust.toString()
                      : "0") +
                  " in",
              style: meansurementStyle)
        ],
      ));
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(SizedBox(
        height: height,
      ));
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Round Under Bust:",
              style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
          const SizedBox(
            width: 10,
          ),
          Text(
              (measurementWomen.roundUnderBust != null
                      ? measurementWomen.roundUnderBust.toString()
                      : "0") +
                  " in",
              style: meansurementStyle)
        ],
      ));
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(SizedBox(
        height: height,
      ));
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Half Length:",
              style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
          const SizedBox(
            width: 10,
          ),
          Text(
              (measurementWomen.halfLength != null
                      ? measurementWomen.halfLength.toString()
                      : "0") +
                  " in",
              style: meansurementStyle)
        ],
      ));
    }

    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(SizedBox(
        height: height,
      ));
    }

    if (type == "Regular" || type == "Top" || type == "JumpSuit") {
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Blouse Waist:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.blouseWaist != null
                        ? measurementWomen.blouseWaist.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
    }
    if (type == "Regular" ||
        type == "Top" ||
        type == "Dresses" ||
        type == "JumpSuit") {
      items.add(
        SizedBox(
          height: height,
        ),
      );
    }
    if (type == "Regular" || type == "Top" || type == "JumpSuit") {
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Blouse Length:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.blouseLength != null
                        ? measurementWomen.blouseLength.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
    }
    if (type == "Regular" || type == "Top" || type == "JumpSuit") {
      items.add(
        SizedBox(
          height: height,
        ),
      );
    }
    if (type == "Regular" || type == "Skirt") {
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Skirt Waist:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.skirtWaist != null
                        ? measurementWomen.skirtWaist.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
    }
    if (type == "Regular" || type == "Skirt") {
      items.add(
        SizedBox(
          height: height,
        ),
      );
    }
    if (type == "Regular" || type == "Skirt") {
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Hips:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.hips != null
                        ? measurementWomen.hips.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
    }
    if (type == "Regular" || type == "Skirt") {
      items.add(
        SizedBox(
          height: height,
        ),
      );
    }

    if (type == "Regular" || type == "Dresses" || type == "JumpSuit") {
      // items.add(
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text("Dress Length:",
      //           style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text(
      //           (measurementWomen.dressLength != null
      //                   ? measurementWomen.dressLength.toString()
      //                   : "0") +
      //               " in",
      //           style: meansurementStyle)
      //     ],
      //   ),
      // );
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Half Dress Length:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.dressHalfLength != null
                        ? measurementWomen.dressHalfLength.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
      items.add(
        SizedBox(
          height: height,
        ),
      );
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Knee Dress Length:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.dressKneeLength != null
                        ? measurementWomen.dressKneeLength.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
      items.add(
        SizedBox(
          height: height,
        ),
      );
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("3/4 Dress Length:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.dress34Length != null
                        ? measurementWomen.dress34Length.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
      items.add(
        SizedBox(
          height: height,
        ),
      );
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Floor Dress Length:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.dressFloorLength != null
                        ? measurementWomen.dressFloorLength.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
    }

    if (type == "Regular" || type == "Dresses" || type == "JumpSuit") {
      items.add(
        SizedBox(
          height: height,
        ),
      );
    }

    if (type == "Regular" || type == "Skirt") {
      // items.add(
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text("Skirt Length:",
      //           style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text(
      //           (measurementWomen.skirtLength != null
      //                   ? measurementWomen.skirtLength.toString()
      //                   : "0") +
      //               " in",
      //           style: meansurementStyle)
      //     ],
      //   ),
      // );
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Knee Skirt Length:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.skirtKneeLength != null
                        ? measurementWomen.skirtKneeLength.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
      items.add(
        SizedBox(
          height: height,
        ),
      );
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("3/4 Skirt Length:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.skirt34Length != null
                        ? measurementWomen.skirt34Length.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
      items.add(
        SizedBox(
          height: height,
        ),
      );
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Floor Skirt Length:",
                style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            const SizedBox(
              width: 10,
            ),
            Text(
                (measurementWomen.skirtFloorLength != null
                        ? measurementWomen.skirtFloorLength.toString()
                        : "0") +
                    " in",
                style: meansurementStyle)
          ],
        ),
      );
    }

    if (type == "Regular" || type == "Skirt") {
      items.add(
        SizedBox(
          height: height,
        ),
      );
    }

    items.add(Container(
      padding: const EdgeInsets.only(bottom: 3),
      width: double.infinity,
      child: const Text(
        "Addtional Information",
        style: TextStyle(fontSize: 14, color: Color(0XFF616161)),
      ),
    ));

    items.add(Row(
      children: [
        Expanded(
          child: Text(measurementWomen.info != null
              ? measurementWomen.info.toString()
              : "No Additional Information"),
        )
      ],
    ));

    return Container(
      color: Colors.white,
      //margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Measurement",
                    style: headingStyle,
                  ),
                ),
              ),
              showEditIcon
                  ? GestureDetector(
                      onTap: () => onEditFunction(),
                      child: const Icon(
                        Icons.edit,
                        color: primaryColor,
                      ),
                    )
                  : Container()
            ],
          ),
          ...items
        ],
      ),
    );
  }
}
