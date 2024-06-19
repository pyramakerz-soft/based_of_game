import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/phonetics_color.dart';

class DragTargetWidget extends StatelessWidget {
  final String title;
  const DragTargetWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.17.sh,
      width: 75.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColorPhonetics.dragContainerColor,
          border: Border.all(width: 2, color: AppColorPhonetics.strokeColor)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: AppColorPhonetics.darkBlueColor,
              fontSize: 0.04.sw,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
