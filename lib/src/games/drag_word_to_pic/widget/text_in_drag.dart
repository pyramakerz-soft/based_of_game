import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../src_model/export_models.dart';
import '../../../core/phonetics_color.dart';
import '../../../core/theme_text.dart';

class TextInDrag extends StatelessWidget {
  final GameImagesGameFinalModel image;

  const TextInDrag({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      color: AppColorPhonetics.lightBlueColor,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        image.word ?? '',
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColorPhonetics.darkBorderColor,
            fontFamily: AppTheme.getFontFamily5()),
        textAlign: TextAlign.center,
      ),
    );
  }
}
