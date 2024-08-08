
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/presentation/components/purpose_widget.dart';
import 'package:trials/features/continue_register/presentation/controller/purposes/purposes_cubit.dart';
import 'package:trials/features/continue_register/presentation/controller/purposes/purposes_state.dart';

import '../../data/models/purpose_model.dart';
import 'choose_option__widget.dart';class PurposesSliver extends StatefulWidget {
  final ValueChanged<List<int>> onGoalSelectionChanged; // Callback for selection changes

  const PurposesSliver({super.key, required this.onGoalSelectionChanged});

  @override
  State<PurposesSliver> createState() => _PurposesSliverState();
}

class _PurposesSliverState extends State<PurposesSliver> {
  List<int> indexes = [];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: [
          BlocBuilder<PurposesCubit, PurposesState>(
            builder: (BuildContext context, state) {
              if (state is PurposeLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PurposeSuccess) {
                List<PurposeModel>? data = state.data;

                return Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: List.generate(data!.length, (index) {
                    return PurposeWidget(
                      data: data[index],
                      selectedIndex: indexes.contains(data[index].id) ? data[index].id : null,
                      onSelected: (selectedIndex) => _handleSelection(selectedIndex),
                    );
                  }),
                );
              } else {
                return SizedBox(); // or other appropriate widget
              }
            },
          ),
        ],
      ),
    );
  }

  void _handleSelection(int index) {
    setState(() {
      if (indexes.contains(index)) {
        indexes.remove(index);
      } else {
        indexes.add(index);
      }
    });

    widget.onGoalSelectionChanged(indexes); // Notify parent about the selection
  }
}
