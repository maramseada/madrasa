import 'package:flutter/material.dart';
import 'package:trials/core/constants/components/button_widget.dart';
import 'package:trials/features/continue_register/presentation/components/school_year_page.dart';
import 'package:trials/features/registration/presentation/screens/new_registration.dart';
import 'package:trials/features/registration/presentation/screens/registration_options.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import 'contact_info_page.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentStep = 1;
  final int _totalSteps = 8;

  final PageController _pageController = PageController();

  void _nextStep() {
    if (_currentStep < _totalSteps) {
      setState(() {
        _currentStep++;
        _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
        _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Stepper Indicator
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Stack(
                  children: [
                    // Background Line
                    Container(
                      height: 10.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // Progress Line

                    Stack(children: [
                      Container(
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        width: MediaQuery.of(context).size.width * (_currentStep / _totalSteps), // Adjust width to fill up to the current step
                      ),
                      if (_currentStep / _totalSteps != 1)
                        Positioned(
                            left: 0,
                            child: Container(
                              width: 5.0,
                              height: 5.0,
                              margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 3.5),
                              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border()),
                            ))
                    ]),
                  ],
                )),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), // Disable swipe
              children: [
                ContactInfo(),
                SchoolYearPage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_currentStep > 1) {
                      _previousStep();
                    }
                  },
                  child: Text('Previous'),
                ),
                if (_currentStep < _totalSteps)
                  ElevatedButton(
                      onPressed: _nextStep,
                      child: Row(
                        children: [
                          Icon(
                            Icons.double_arrow,
                            color: Colors.white,
                          ),
                          Text(
                            'التالي',
                            style: AppStyles.style60016(context: context, color: Colors.white),
                          )
                        ],
                      ), ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
