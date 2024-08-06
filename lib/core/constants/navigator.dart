import 'package:flutter/material.dart';

Future<T?> navigateTo<T>(BuildContext context, Widget page) {
  return Navigator.push<T>(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}


void navigateWithoutHistory(context, page) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => page), (route) => false);
}
