import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/phonetics_color.dart';
import '../../../core/theme_text.dart';

class ChooseWord extends StatelessWidget{
  final String word;

  const ChooseWord({super.key, required this.word});
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 1,
      dashPattern: [8, 4],
      color:
      AppColorPhonetics.darkBorderColor,

      borderType: BorderType.RRect,
      radius: const Radius.circular(7),
      // padding: const EdgeInsets.all(6),
      child: Container(
        width: 25.w,
        alignment: Alignment.center,
        height: 30.h,
        child: Text(
          word,
          style: TextStyle(
              fontSize: 20,
              fontFamily:
              AppTheme.getFontFamily5(),
              color: AppColorPhonetics
                  .darkBorderColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}