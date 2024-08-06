import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/font_styles.dart';

class OptionsWidget extends StatelessWidget {
  final String image;
  final String title;
  final int index;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  const OptionsWidget({
    super.key,
    required this.image,
    required this.index,
    required this.title,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        onSelected(index);
      },
      child: Container(
        height: size.height * 0.25,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.06), // Shadow color
              spreadRadius: 10, // How much the shadow should spread
              blurRadius: 10, // How soft the shadow should be
              offset: const Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              fit: BoxFit.scaleDown,
              height: size.height * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold16(
                      context: context,
                      color:
                          index == selectedIndex ? Colors.green : Colors.black),
                ),
                const SizedBox(width: 5,),
                index == selectedIndex
                    ? const Icon(
                        CupertinoIcons.check_mark_circled,
                        color: Colors.green,
                      )
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
