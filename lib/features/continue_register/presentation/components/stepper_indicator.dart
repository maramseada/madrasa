import 'package:flutter/material.dart';

class StepperIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepperIndicator({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 10.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: MediaQuery.of(context).size.width *
                          (currentStep / totalSteps),
                    ),
                    if (currentStep / totalSteps != 1)
                      Positioned(
                        left: 0,
                        child: Container(
                          width: 5.0,
                          height: 5.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 2.5, horizontal: 3.5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}