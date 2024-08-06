import 'package:flutter/material.dart';
import 'package:trials/core/constants/font_size.dart';

class ButtonWidget extends StatelessWidget {
  final Widget widget;

  const ButtonWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: getResponsiveFontSize(context, fontSize: 10)),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(child: widget),
    );
  }
}
