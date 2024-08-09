import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import '../../../../core/api.dart';
import '../../../../core/constants/app_constants.dart';

class RegisterDataSource {
  Future register(
      {  int? age,
        required String firstName,
        required String secondName,
        String? gender,
        String? nationality,
        required String whatsapp,
        String? difficulties,
        required String email,
        String? description,
        String? subject}) async {
    try {
      FormData formData = FormData.fromMap({
        'first_name': firstName,
        'family_name': secondName,
        'age': age,
        'gender': gender,
        'nationality': nationality,
        'whatsapp': '+2$whatsapp',
        'email': email,
        'difficulties': difficulties,
        'description': description,
        'subject': subject,
      });

      var response = await Api().post(
        url: '${AppConstants().baseUrl}form/',
        formData: formData,
      );

      int data = response['id'];
      debugPrint('$data');
      return data.toString();
    } catch (e) {
      debugPrint('Error loading profile data: $e');
      rethrow; // Rethrow the caught exception to propagate it up the call stack
    }
  }
}
