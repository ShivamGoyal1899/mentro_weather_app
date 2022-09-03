import 'package:flutter/material.dart';

class RoundedEdgeDivider extends StatelessWidget {
  final Color color;

  const RoundedEdgeDivider({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      height: 5.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color,
      ),
    );
  }
}
