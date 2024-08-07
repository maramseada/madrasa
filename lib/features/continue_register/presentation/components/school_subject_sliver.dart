import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';

class SchoolSubjectSliver extends StatelessWidget {
  const SchoolSubjectSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return        SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.2), // Shadow color
                      spreadRadius:
                      2, // How much the shadow should spread
                      blurRadius: 5, // How soft the shadow should be
                      offset: const Offset(
                          0, 5), // Changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  border:
                  Border.all(color: Color(AppColors.grayBorder)),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'الصف الخامس',
                style: AppStyles.style40016(context: context),
              )),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.2), // Shadow color
                    spreadRadius:
                    2, // How much the shadow should spread
                    blurRadius: 5, // How soft the shadow should be
                    offset: const Offset(
                        0, 5), // Changes position of shadow
                  ),
                ],
                color: Colors.white,   border: Border.all(color: Color(AppColors.grayBorder)),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              'الصف السادس',
              style: AppStyles.style40016(context: context),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.2), // Shadow color
                      spreadRadius:
                      2, // How much the shadow should spread
                      blurRadius: 5, // How soft the shadow should be
                      offset: const Offset(
                          0, 5), // Changes position of shadow
                    ),
                  ],
                  color: Colors.white,    border:
              Border.all(color: Color(AppColors.grayBorder)),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'الصف السابع',
                style: AppStyles.style40016(context: context),
              )),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.2), // Shadow color
                    spreadRadius:
                    2, // How much the shadow should spread
                    blurRadius: 5, // How soft the shadow should be
                    offset: const Offset(
                        0, 5), // Changes position of shadow
                  ),
                ],
                color: Colors.white,    border: Border.all(color: Color(AppColors.grayBorder)),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              'الصف الثامن',
              style: AppStyles.style40016(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
