import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/phonetics_color.dart';
import '../../../core/theme_text.dart';

class WrongWord extends StatelessWidget{
  final String word;

  const WrongWord({super.key, required this.word});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 35.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColorPhonetics.redColor,
          borderRadius:
          BorderRadius.circular(3)),
      child: Text(
        word,
        style: TextStyle(
            fontSize: 20,
            fontFamily:
            AppTheme.getFontFamily5(),
            color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

}