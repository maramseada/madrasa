import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:trials/core/constants/colors.dart';
import 'package:trials/core/constants/font_styles.dart';
import 'package:trials/core/constants/text.dart';
import 'package:trials/features/continue_register/presentation/components/school_level_sliver.dart';
import 'package:trials/features/continue_register/presentation/components/school_subject_sliver.dart';
import 'package:trials/features/continue_register/presentation/components/school_year_sliver.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../registration/presentation/components/register_new_animating_text.dart';
import 'content_size_grid_view.dart';

class SchoolYearPage extends StatelessWidget {
  const SchoolYearPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        slivers: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: SliverToBoxAdapter(
              child: RegisterNewAnimatingText(
                  color: Colors.yellow, text: AppText.chooseSchoolYear),
            ),
          ),

          SliverToBoxAdapter(
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                duration: const Duration(seconds: 1),
              ),
              atRestEffect: WidgetRestingEffects.none(),
              child: Text(
                'حدد المرحلة الدراسية',
                style: AppStyles.styleBold18(context: context),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SchoolLevelSliver(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'حدد السنة الدراسية',
              style: AppStyles.styleBold18(context: context),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SchoolYearSliver(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'حدد المنهج الدراسية',
              style: AppStyles.styleBold18(context: context),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SchoolSubjectSliver(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),   ],
      ),
    );
  }
}
