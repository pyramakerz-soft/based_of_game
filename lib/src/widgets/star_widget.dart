import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  final String image;

  const StarWidget({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 10,
      width: 10,
    );
  }
}
