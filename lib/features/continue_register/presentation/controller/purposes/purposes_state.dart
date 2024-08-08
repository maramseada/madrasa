import 'package:flutter/cupertino.dart';

import '../../../data/models/material_model.dart';
import '../../../data/models/purpose_model.dart';

@immutable

abstract class PurposesState {}
class PurposeInitial extends PurposesState{}
class PurposeLoading extends PurposesState{}
class PurposeSuccess extends PurposesState{
 final   List<PurposeModel>?  data;
   PurposeSuccess({required this.data});
}class PostPurposeSuccess extends PurposesState{
 final   String?  message;
 PostPurposeSuccess({required this.message});
}


class PurposeFailure extends PurposesState{

 final  String errMessage;
  PurposeFailure({required this.errMessage});
}