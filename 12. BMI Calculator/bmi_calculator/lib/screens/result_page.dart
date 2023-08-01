import 'package:bmi_calculator/components/background_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.result, required this.bmi, required this.comment});

  final String result;
  final String bmi;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: BackgroundCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmi,
                      style: kBmiTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        comment,
                        style: kCaptionTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
                text: 'RE-CALCULATE',
                onPress: () {
                 Navigator.pop(context);
                })
          ],
        ));
  }
}
