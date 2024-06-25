import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../src_model/export_models.dart';
import '../../../core/phonetics_color.dart';

class ImageInDrag extends StatelessWidget {
  final GameImagesGameFinalModel image;

  const ImageInDrag({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      height: 50.h,
      padding: const EdgeInsets.only(left: 4.40, right: 3.70, bottom: 0.44),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppColorPhonetics.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.36),
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: image.image ?? '',
        placeholder: (context, url) => const Center(
          child: CupertinoActivityIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }
}
