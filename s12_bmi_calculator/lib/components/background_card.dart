import 'package:flutter/material.dart';

class BackgroundCard extends StatelessWidget {
  BackgroundCard(
      {super.key, required this.color, this.cardChild, this.onClick});

  final Function()? onClick;
  final Color color;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: cardChild,
      ),
    );
  }
}

