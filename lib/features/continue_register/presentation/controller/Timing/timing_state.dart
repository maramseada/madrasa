import 'package:flutter/cupertino.dart';

import '../../../data/models/day_model.dart';
import '../../../data/models/material_model.dart';
import '../../../data/models/purpose_model.dart';

@immutable

abstract class TimingState {}
class TimingInitial extends TimingState{}
class TimingLoading extends TimingState{}
class TimingSuccess extends TimingState{
 final   List<DaysModel>?  data;
 final String?  message;
   TimingSuccess({ this.data, this.message});
}


class TimingFailure extends TimingState{

 final  String errMessage;
  TimingFailure({required this.errMessage});
}