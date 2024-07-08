import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/phonetics_color.dart';
import '../../../core/theme_text.dart';

class MasterWord extends StatelessWidget{
  final String word;

  const MasterWord({super.key, required this.word});
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: 25.w,
      height: 35.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColorPhonetics.darkBorderColor,
          borderRadius: BorderRadius.circular(7)),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        word,
        style: TextStyle(
            fontSize: 20,
            fontFamily: AppTheme.getFontFamily5(),
            color: AppColorPhonetics.white),
        textAlign: TextAlign.center,
      ),
    );
  }

}