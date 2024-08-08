


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/presentation/components/subscription_widget.dart';

import '../../data/models/supscription_model.dart';
import '../controller/subscriptions/subscriptions_cubit.dart';
import '../controller/subscriptions/subscriptions_state.dart';
class SubScriptionsSlivers extends StatefulWidget {
  final ValueChanged<int?> onSubScriptionsChanged;

  const SubScriptionsSlivers({super.key, required this.onSubScriptionsChanged});

  @override
  State<SubScriptionsSlivers> createState() => _SubScriptionsSliversState();
}

class _SubScriptionsSliversState extends State<SubScriptionsSlivers> {
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
          return const SizedBox(); // or other appropriate widget
        }
      },
    );
  }
}
