import 'package:flutter/material.dart';
import 'package:trials/features/registration/presentation/screens/new_registration.dart';
import 'package:trials/features/registration/presentation/screens/registration_options.dart';

void main() {

runApp(  MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
      home: RegistrationOptions()
    );
  }
}

