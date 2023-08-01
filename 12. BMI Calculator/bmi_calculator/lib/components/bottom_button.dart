import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.text, required this.onPress});

  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: kBottomBarHeight,
        width: double.infinity,
        color: kPrimaryColor,
        margin: const EdgeInsets.only(top: 8),
        child: Center(
          child: Text(
            text,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

