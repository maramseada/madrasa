
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/presentation/components/days_widget.dart';

import '../../data/models/day_model.dart';
import '../controller/Timing/timing_cubit.dart';
import '../controller/Timing/timing_state.dart';

class DaysSliver extends StatefulWidget {
  final ValueChanged<List<int>> onGoalSelectionChanged; // Callback for selection changes

  const DaysSliver({super.key, required this.onGoalSelectionChanged});

  @override
  State<DaysSliver> createState() => _DaysSliverState();
}

class _DaysSliverState extends State<DaysSliver> {
  List<int> indexes = [];
  List<DaysModel>? data;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: [
          BlocBuilder<TimingCubit, TimingState>(

            builder: (BuildContext context, state) {
              data = BlocProvider.of<TimingCubit>(context).data;
              if (state is TimingLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TimingSuccess) {
                List<DaysModel>? data = state.data;

                return Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: List.generate(data!.length, (index) {
                    return DaysWidget(
                      data: data[index],
                      selectedIndex: indexes.contains(data[index].id) ? data[index].id : null,
                      onSelected: (selectedIndex) => _handleSelection(selectedIndex),
                    );
                  }),
                );
              } else {
                return Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: List.generate(data!.length, (index) {
                    return DaysWidget(
                      data: data![index],
                      selectedIndex: indexes.contains(data![index].id) ? data![index].id : null,
                      onSelected: (selectedIndex) => _handleSelection(selectedIndex),
                    );
                  }),
                ); // or other appropriate widget
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
