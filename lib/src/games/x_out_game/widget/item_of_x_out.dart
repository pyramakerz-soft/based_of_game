import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/phonetics_color.dart';

class XOutItemWidget extends StatelessWidget {
  const XOutItemWidget({
    Key? key,
    required this.imageName,
    required this.isSelected,
    required this.isCorrect,
    required this.word,
    required this.onTap,
  }) : super(key: key);

  final String imageName;
  final String word;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? (isCorrect
                  ? AppColorPhonetics.greenColor3
                  : AppColorPhonetics.incorrect)
              : Colors.white,
          border: Border.all(color: AppColorPhonetics.skyBlueColor, width: 3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: imageName,
              fit: BoxFit.fill,
              height: 70.h,
              // width: 50.w,
              errorWidget: (context, url, error) {
                return Center(
                  child: Text(word),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
