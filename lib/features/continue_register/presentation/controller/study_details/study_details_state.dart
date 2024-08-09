import 'package:flutter/cupertino.dart';

import '../../../data/models/material_model.dart';
import '../../../data/models/purpose_model.dart';

@immutable
abstract class StudyDetailsState {}

class StudyDetailsInitial extends StudyDetailsState {}

class StudyDetailsLoading extends StudyDetailsState {}

class PostStudyDetailsSuccess extends StudyDetailsState {
  final String? message;
  PostStudyDetailsSuccess({required this.message});
}

class StudyDetailsFailure extends StudyDetailsState {
  final String errMessage;
  StudyDetailsFailure({required this.errMessage});
}
