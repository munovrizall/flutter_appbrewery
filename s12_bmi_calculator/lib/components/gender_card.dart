import 'package:flutter/material.dart';
import '../constants.dart';

class GenderCard extends StatelessWidget {
  GenderCard({super.key, required this.faIcon, required this.label});

  final IconData faIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          faIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 8,
        ),
        Text(label, style: kLabelTextStyle)
      ],
    );
  }
}
