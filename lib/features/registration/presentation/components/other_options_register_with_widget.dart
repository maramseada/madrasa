import 'package:flutter/material.dart';

class OtherOptionsRegisterWithWidget extends StatelessWidget {
  final Widget widget;
  const OtherOptionsRegisterWithWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.green)),
      child: Center(
        child: widget,
      ),
    );
  }
}
