import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtons({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [          if (currentStep !=totalSteps)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: onPrevious,
            child: const Row(
              children: [
                Icon(
                  Icons.double_arrow_sharp,
                  color: Colors.green,
                ),
                Text(
                  ' السابق',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
          if (currentStep != totalSteps)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: onNext,
              child: Row(
                children: [
                  const Text(
                    'التالي',
                    style: TextStyle(color: Colors.white),
                  ),
                  Transform.rotate(
                    angle: 3.14,
                    child: const Icon(
                      Icons.double_arrow_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
