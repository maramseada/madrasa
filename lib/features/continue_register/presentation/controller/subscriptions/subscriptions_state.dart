import 'package:flutter/cupertino.dart';

import '../../../data/models/material_model.dart';
import '../../../data/models/purpose_model.dart';
import '../../../data/models/supscription_model.dart';

@immutable

abstract class SubscriptionsState {}
class SubscriptionsInitial extends SubscriptionsState{}
class SubscriptionsLoading extends SubscriptionsState{}
class SubscriptionsSuccess extends SubscriptionsState{
 final   List<SubscriptionModel>?  data;
   SubscriptionsSuccess({required this.data});
}class PostSubscriptionsSuccess extends SubscriptionsState{
 final   String?  message;
 PostSubscriptionsSuccess({required this.message});
}


class SubscriptionsFailure extends SubscriptionsState{

 final  String errMessage;
  SubscriptionsFailure({required this.errMessage});
}