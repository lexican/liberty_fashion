import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../utils/utils.dart';

class LibertyFashionModal {
  Widget? child;
  BuildContext? context;
  LibertyFashionModal({@required this.child, @required this.context}) {
    _showModal();
  }
  void _showModal() {
    showCustomModalBottomSheet(
      context: context!,
      builder: (context) {
        return child!;
      },
      containerWidget: (_, animation, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Material(
            color: backgroundColor,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(12),
            child: child,
          ),
        ),
      ),
      expand: false,
    );
  }
}
