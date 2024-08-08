import 'package:flutter/cupertino.dart';

import '../../data/models/material_model.dart';

@immutable

abstract class MaterialsState {}
class MaterialInitial extends MaterialsState{}
class MaterialLoading extends MaterialsState{}
class MaterialSuccess extends MaterialsState{
 final   List<MaterialModel>?  data;
   MaterialSuccess({required this.data});
}class PostMaterialSuccess extends MaterialsState{
 final   String?  message;
 PostMaterialSuccess({required this.message});
}


class MaterialFailure extends MaterialsState{

 final  String errMessage;
  MaterialFailure({required this.errMessage});
}