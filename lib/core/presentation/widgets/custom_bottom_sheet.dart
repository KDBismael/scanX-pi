import 'package:flutter/material.dart';

class CustomBottomSheet {
  Future<void> sheet(
      {required BuildContext context,
      required EdgeInsetsGeometry padding,
      required Widget modalContent}) {
    final size = MediaQuery.of(context).size;

    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints.expand(height: size.height * 0.78),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          // side: BorderSide(color: Color(0xFF0ABAB5), width: 3),
        ),
        builder: (context) {
          return Container(
            padding: padding,
            child: modalContent,
          );
        });
  }
}
