import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/data/data_source/material_data_source.dart';

import '../../../../core/constants/font_styles.dart';
import '../../data/models/material_model.dart';
import '../components/subject_widget.dart';
import '../controller/materials/material_cubit.dart';
import '../controller/materials/material_state.dart';
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
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'حدد المواد اللتي ترغب في دراستها ',
                      style: AppStyles.styleBold18(context: context),
                    ),
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    childAspectRatio: 1.2,

                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return SubjectWidget(
                        index: index + 1,
                        selectedIndex: indexes.contains(index + 1) ? index + 1 : null,
                        onSelected: (index) => _handleSelection(index),
                        data: data![index],
                      );
                    },
                    childCount: data?.length,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                )
              ],
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