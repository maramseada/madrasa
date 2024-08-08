import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:trials/features/continue_register/data/models/material_model.dart';

import '../../../../core/api.dart';
import '../../../../core/constants/app_constants.dart';

class MaterialData {
  Future getMaterials() async {
    try {
      var response = await Api().get(
        url: '${AppConstants().baseUrl}material/',
        formData: null,
      );

      List<dynamic> responseData = response; // Assuming 'data' is a list
      List<MaterialModel> products =
          responseData.map((item) => MaterialModel.fromJson(item)).toList();
      debugPrint('$products');
      return products;
    } catch (e) {
      print('Error loading profile data: $e');
      rethrow; // Rethrow the caught exception to propagate it up the call stack
    }
  }

  Future postMaterials({required int id, required List<int> materials}) async {
    try {
      FormData formData = FormData.fromMap({
        'form': id,
        'materials': materials,
      });

      var response = await Api().post(
        url: '${AppConstants().baseUrl}course/',
        formData: formData,
      );

     int data = response['form'];
      debugPrint('$data');
      return data.toString();
    } catch (e) {
      print('Error loading profile data: $e');
      rethrow; // Rethrow the caught exception to propagate it up the call stack
    }
  }

}
