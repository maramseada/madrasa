


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/presentation/components/subscription_widget.dart';

import '../../data/models/supscription_model.dart';
import '../controller/subscriptions/subscriptions_cubit.dart';
import '../controller/subscriptions/subscriptions_state.dart';
class SubscriptionsSlivers extends StatefulWidget {
  final ValueChanged<int?> onSubScriptionsChanged;

  const SubscriptionsSlivers({super.key, required this.onSubScriptionsChanged});

  @override
  State<SubscriptionsSlivers> createState() => _SubscriptionsSliversState();
}
List<SubscriptionModel>? data;
class _SubscriptionsSliversState extends State<SubscriptionsSlivers> {
  int? selectedIndex;

  void _handleSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onSubScriptionsChanged(index); // Notify parent about the selection
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionsCubit, SubscriptionsState>(

        builder: (BuildContext context, state) {
          data =BlocProvider.of<SubscriptionsCubit>(context).data;
          if (state is SubscriptionsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SubscriptionsSuccess) {
          List<SubscriptionModel>? data = state.data;

          return Wrap(
            spacing: 8,
            runSpacing: 10,
            children: List.generate(data!.length, (index) {
              return SubscriptionWidget(
                data: data[index],
                selectedIndex: selectedIndex,
                onSelected: (selectedIndex) => _handleSelection(selectedIndex),
              );
            }),
          );
        } else {
          return Wrap(
            spacing: 8,
            runSpacing: 10,
            children: List.generate(data!.length, (index) {
              return SubscriptionWidget(
                data: data![index],
                selectedIndex: selectedIndex,
                onSelected: (selectedIndex) => _handleSelection(selectedIndex),
              );
            }),
          ); // or other appropriate widget
        }
      },
    );
  }
}
