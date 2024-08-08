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

  // Future getMaterials() async {
  //   try {
  //     var response = await Api().get(
  //       url: '${AppConstants().baseUrl}center/products',
  //       formData: null,
  //     );
  //
  //     if (response != null && response['status'] == true) {
  //       List<dynamic> responseData = response['data']['products']; // Assuming 'data' is a list
  //       List<ProductMaterial> products = responseData
  //           .map((item) => ProductMaterial.fromJson(item))
  //           .toList();
  //       print(products);
  //       return products;
  //     } else {
  //       throw Exception('Failed to load profile data');
  //     }
  //   } catch (e) {
  //     print('Error loading profile data: $e');
  //     rethrow; // Rethrow the caught exception to propagate it up the call stack
  //   }
  // }
  // Future<String?> addProduct({
  //   required String name,
  //   required String price,
  //   required String description,
  //   required String department,
  //   required File image,
  // }) async {
  //   try {
  //     String fileName = image.path.split('/').last;
  //
  //     FormData formData = FormData.fromMap({
  //       'name': name,
  //       'price': price,
  //       'description': description,
  //       'department': department,
  //       'image': await MultipartFile.fromFile(image.path, filename: fileName),
  //     });
  //
  //     var response = await Api().post(
  //       url: '${AppConstants().baseUrl}center/addproduct',
  //       formData: formData,
  //     );
  //
  //     if (response != null) {
  //       if (response['status'] == true) {
  //         String message = response['message'];
  //         return message;
  //       } else {
  //         List<dynamic> errorMessage = response['message'];
  //         throw errorMessage.join(', '); // Join list elements into a string
  //       }
  //     } else {
  //       throw Exception('Failed to add product');
  //     }
  //   } catch (e) {
  //     print('Error adding product: $e');
  //     return null;
  //   }
  // }
  //
  // Future<String?> editProduct({
  //   String? name,
  //   String? price,
  //   String? description,
  //   String? department,
  //   File? image,
  //   required int id,
  // }) async {
  //
  //   Map<String, dynamic> requestBody = {};
  //   if (name != null && name.isNotEmpty) {
  //     requestBody['name'] = name;
  //   }
  //   if (price != null && price.isNotEmpty) {
  //     requestBody['price'] = price;
  //   }
  //   if (description != null && description.isNotEmpty) {
  //     requestBody['description'] = description;
  //   }
  //   if (department != null && department.isNotEmpty) {
  //     requestBody['department'] = department;
  //   }
  //   if (image != null ) {
  //     requestBody['image'] = image;
  //   }
  //
  //
  //   try {
  //
  //     var response = await Api().post(
  //       url: '${AppConstants().baseUrl}center/editproduct/$id',
  //       formData:  FormData.fromMap(requestBody),
  //     );
  //
  //     if (response != null) {
  //       if (response['status'] == true) {
  //         String message = response['message'];
  //         return message;
  //       } else {
  //         List<dynamic> errorMessage = response['message'];
  //         throw errorMessage.join(', '); // Join list elements into a string
  //       }
  //     } else {
  //       throw Exception('Failed to edit product');
  //     }
  //
  //
  //   } catch (e) {
  //     print('Error editing product: $e');
  //     return null;
  //   }
  // }
  //
  // Future deleteMaterial({required int id})async{
  //
  //
  //
  //   Map<String, dynamic> response = await Api().get(
  //     url: '${AppConstants().baseUrl}center/deleteproduct/$id',
  //     formData: null,
  //
  //   );
  //
  //   if (response['status'] == true) {
  //     return response['message'];
  //   } else {
  //     throw Exception(response['message']);
  //   }
  // }
  // Future<ProductMaterial> showMaterial({required int id}) async {
  //   try {
  //     // Make the API call to fetch service data
  //     Map<String, dynamic> response = await Api().get(
  //       url: '${AppConstants().baseUrl}center/showproduct/$id',
  //       formData: null,
  //     );
  //
  //     // Check if the response contains valid data and status is true
  //     if (response != null && response['status'] == true) {
  //       // Parse the response data into a ProductMaterial object
  //       ProductMaterial product = ProductMaterial.fromJson(response['data']);
  //       return product;
  //     } else {
  //       throw Exception(response['message']);
  //     }
  //   } catch (e) {
  //     // Handle any exceptions that occur during API call or parsing
  //     throw Exception('Failed to load service: $e');
  //   }
  // }
}
