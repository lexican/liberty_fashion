import 'package:flutter/material.dart';
import 'package:liberty_fashion/modals/floating_modal_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  @required dynamic builder,
  Color? backgroundColor,
}) async {
  final result = await showCustomModalBottomSheet(
    context: context,
    builder: builder,
    containerWidget: (_, animation, child) => FloatingModal(
      child: child,
    ),
    expand: false,
  );
  return result;
}
