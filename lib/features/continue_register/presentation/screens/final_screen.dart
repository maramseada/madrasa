import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:trials/core/constants/font_styles.dart';
import 'package:trials/core/constants/text.dart';

import '../../../../core/constants/components/button_widget.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

final _controllerCenter = ConfettiController(duration: const Duration(seconds: 10));

Path drawStar(Size size) {
  double degToRad(double deg) => deg * (pi / 180.0);

  const numberOfPoints = 5;
  final halfWidth = size.width / 2;
  final externalRadius = halfWidth;
  final internalRadius = halfWidth / 2.5;
  final degreesPerStep = degToRad(360 / numberOfPoints);
  final halfDegreesPerStep = degreesPerStep / 2;
  final path = Path();
  final fullAngle = degToRad(360);
  path.moveTo(size.width, halfWidth);

  for (double step = 0; step < fullAngle; step += degreesPerStep) {
    path.lineTo(halfWidth + externalRadius * cos(step), halfWidth + externalRadius * sin(step));
    path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep), halfWidth + internalRadius * sin(step + halfDegreesPerStep));
  }
  path.close();
  return path;
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  void initState() {
    super.initState();
    _controllerCenter.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
                shouldLoop: true, // start again as soon as the animation is finished
                colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple], // manually specify the colors to be used
                createParticlePath: drawStar, // define a custom shape/path.
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            )
          ]),
          SizedBox(
            height: 20,
          ),
          Text(
            AppText.succesPayment,
            style: AppStyles.styleBold16(context: context, color: Colors.green),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            AppText.thankYou,
            style: AppStyles.styleRegular14(context: context, color: Colors.green),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: (){
              _controllerCenter.play();
            },
        child:
          ButtonWidget(
              widget: Text(
            AppText.redirect,
            style: AppStyles.styleBold18(context: context, color: Colors.white),
          )))
        ],
      ),
    );
  }
}
