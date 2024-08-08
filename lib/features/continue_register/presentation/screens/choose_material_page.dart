import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/data/data_source/material_data_source.dart';

import '../../data/models/material_model.dart';
import '../components/subject_widget.dart';
import '../controller/material_cubit.dart';
import '../controller/material_state.dart';
class ChooseMaterialPage extends StatefulWidget {
  final Function(List<int>) onSelectionChanged;

  const ChooseMaterialPage({super.key, required this.onSelectionChanged});

  @override
  State<ChooseMaterialPage> createState() => _ChooseMaterialPageState();
}

class _ChooseMaterialPageState extends State<ChooseMaterialPage> {
  List<int> indexes = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          MaterialCubit(MaterialData())..getMaterials(),
        ),
      ],
      child: BlocBuilder<MaterialCubit, MaterialsState>(
        builder: (BuildContext context, state) {
          if (state is MaterialLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MaterialSuccess) {
            List<MaterialModel>? data = state.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                childAspectRatio: 1.2,
              ),
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index) => SubjectWidget(
                index: index + 1,
                selectedIndex: indexes.contains(index + 1) ? index + 1 : null,
                onSelected: (index) => _handleSelection(index),
                data: data![index],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
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
    widget.onSelectionChanged(indexes);
    print(indexes);
  }
}