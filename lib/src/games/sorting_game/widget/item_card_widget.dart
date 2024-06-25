import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../src_model/export_models.dart';

class ItemCardWidget extends StatelessWidget {
  final void Function()? onTap;
  final GameImagesGameFinalModel body;
  final int index;
  final GameImagesGameFinalModel data;

  const ItemCardWidget(
      {super.key,
      required this.body,
      this.onTap,
      required this.index,
      required this.data});
  @override
  Widget build(BuildContext context) {
    return Draggable<GameImagesGameFinalModel>(
      // Data is the value this Draggable stores.
      data: data,

      feedback: Transform.translate(
          offset:
              const Offset(30, 0), // Adjust the offset to center the feedback
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 70.0,
              width: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CachedNetworkImage(
                imageUrl: body.image!,
                placeholder: (context, url) => const Center(
                  child: CupertinoActivityIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                // height: ,
              ),
            ),
          )),
      childWhenDragging: const SizedBox(),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: CachedNetworkImage(
              imageUrl: body.image!,
              placeholder: (context, url) => const Center(
                child: CupertinoActivityIndicator(),
              ),
              errorWidget: (context, url, error) => Center(
                child: Text('${body.word}'),
              ),
              // height: ,
            ),
          ),
        ),
      ),
    );
  }
}
