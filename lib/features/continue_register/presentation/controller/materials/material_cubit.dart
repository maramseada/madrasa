import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/data/data_source/material_data_source.dart';
import 'package:trials/features/continue_register/data/models/material_model.dart';

import 'material_state.dart';

class MaterialCubit extends Cubit<MaterialsState> {
  MaterialData api;
  String? message;
  List<MaterialModel>? data;
  MaterialCubit(this.api) : super(MaterialInitial());

   getMaterials() async {
    emit(MaterialLoading());
    try {
      data = await api.getMaterials();
      emit(MaterialSuccess(
        data: data,
      ));
      print('nlkesfnefn$message');
    } on Exception catch (e, stackTrace) {
      emit(MaterialFailure(errMessage: 'error: $e'));
      debugPrint('$e');
      debugPrint('$stackTrace');

    }
  }   postMaterials({ required List<int> materials}) async {
    emit(MaterialLoading());
    try {
      message = await api.postMaterials(materials: materials);
      emit(PostMaterialSuccess(
        message: message,
      ));
      return true;
    } on Exception catch (e, stackTrace) {
      emit(MaterialFailure(errMessage: 'error: $e'));
      debugPrint('$e');
      debugPrint('$stackTrace');

      return false;

    }
  }
}
