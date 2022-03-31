import 'package:flutter/material.dart';
import 'package:liberty_fashion/models/men_measurement_model.dart';
import 'package:liberty_fashion/utils/utils.dart';

class MenMeasurementView extends StatelessWidget {
  final MenMeasurementModel measurementMen;
  const MenMeasurementView(
      {Key? key,
      required this.measurementMen,
      required this.showEditIcon,
      required this.onEditFunction,
      required this.type})
      : super(key: key);

  final TextStyle headingStyle = const TextStyle(
    color: Color(0XFF000000),
    fontSize: 18,
    fontFamily: 'Roboto',
  );

  final TextStyle meansurementTitle =
      const TextStyle(fontFamily: "SegoeUi", fontSize: 16);

  final TextStyle meansurementStyle = const TextStyle(
      fontFamily: "SegoeUi", fontSize: 16, fontWeight: FontWeight.w600);

  final VoidCallback onEditFunction;
  final bool showEditIcon;
  final String type;

  final height = 10.0;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    if (type == "Regular" || type == "Top") {
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text("Shoulder:", style: meansurementTitle)),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                  (measurementMen.shoulder != null
                          ? measurementMen.shoulder.toString()
                          : "0") +
                      " cm",
                  style: meansurementStyle),
            ),
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
            const Flexible(
              child: Text("Sleeve:",
                  style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                  (measurementMen.sleeve != null
                          ? measurementMen.sleeve.toString()
                          : "0") +
                      " cm",
                  style: meansurementStyle),
            )
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
            const Flexible(
              child: Text("Chest:",
                  style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                  (measurementMen.chest != null
                          ? measurementMen.chest.toString()
                          : "0") +
                      " cm",
                  style: meansurementStyle),
            )
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
            const Flexible(
              child: Text("Top Length:",
                  style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                  (measurementMen.topLength != null
                          ? measurementMen.topLength.toString()
                          : "0") +
                      " cm",
                  style: meansurementStyle),
            )
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
            const Flexible(
              child: Text("Bicep:",
                  style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                  (measurementMen.bicep != null
                          ? measurementMen.bicep.toString()
                          : "0") +
                      " cm",
                  style: meansurementStyle),
            )
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
            const Flexible(
              child: Text("Wrist:",
                  style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                  (measurementMen.wrist != null
                          ? measurementMen.wrist.toString()
                          : "0") +
                      " cm",
                  style: meansurementStyle),
            )
          ],
        ),
      );
      // items.add(
      //   SizedBox(
      //     height: height,
      //   ),
      // );
      // items.add(
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Flexible(
      //         child: Text("Hips:",
      //             style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Flexible(
      //         child: Text(
      //             (measurementMen.hip != null
      //                     ? measurementMen.hip.toString()
      //                     : "0") +
      //                 " cm",
      //             style: meansurementStyle),
      //       )
      //     ],
      //   ),
      // );
      items.add(
        SizedBox(
          height: height,
        ),
      );
    }

    if (type == "Regular" || type == "Trouser") {
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              child: Text("Trouser Length:",
                  style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                  (measurementMen.trouserLength != null
                          ? measurementMen.trouserLength.toString()
                          : "0") +
                      " cm",
                  style: meansurementStyle),
            )
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
            const Flexible(
              child: Text("Thigh:",
                  style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                  (measurementMen.thigh != null
                          ? measurementMen.thigh.toString()
                          : "0") +
                      " cm",
                  style: meansurementStyle),
            )
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
            const Flexible(
              child: Text("Trouser Tip:",
                  style: TextStyle(fontFamily: "SegoeUi", fontSize: 14)),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                  (measurementMen.trouserTip != null
                          ? measurementMen.trouserTip.toString()
                          : "0") +
                      " cm",
                  style: meansurementStyle),
            )
          ],
        ),
      );
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
          child: Text(measurementMen.info != null
              ? measurementMen.info.toString()
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
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Measurement",
                    style: headingStyle,
                  ),
                ),
              ),
              showEditIcon
                  ? GestureDetector(
                      onTap: () {
                        onEditFunction();
                      },
                      child: const Icon(
                        Icons.edit,
                        color: primaryColor,
                      ),
                    )
                  : Container(),
            ],
          ),
          ...items
        ],
      ),
    );
  }
}
