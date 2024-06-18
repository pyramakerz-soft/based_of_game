import 'package:flutter/material.dart';
import '../../../core/phonetics_color.dart';
import '../../../core/theme_text.dart';

class StrokedText extends StatelessWidget {
  final String text;
  final bool isDisabled;
  double? fontSize;
  double? strokeWidth;
  bool? hasShadows;

  StrokedText({
    required this.text,
    required this.isDisabled,
    this.fontSize,
    this.strokeWidth,
    this.hasShadows,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            shadows: hasShadows == true
                ? [
                    Shadow(
                      color: AppColorPhonetics.darkBlueColor6.withOpacity(0.5),
                      blurRadius: 0.0,
                      offset: const Offset(2.0, 2.0),
                    ),
                    Shadow(
                      color: AppColorPhonetics.darkBlueColor6.withOpacity(0.5),
                      blurRadius: 0.0,
                      offset: const Offset(-2.0, -3.0),
                    ),
                  ]
                : null,
            fontSize: fontSize ?? 39,
            fontWeight: FontWeight.w900,
            fontFamily: AppTheme.getFontFamily5(),
            foreground: Paint()
              ..color = isDisabled
                  ? AppColorPhonetics.white.withOpacity(0.5)
                  : AppColorPhonetics.white,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: AppTheme.getFontFamily5(),
            fontSize: fontSize ?? 39,
            foreground: Paint()
              ..strokeWidth = strokeWidth ?? 1.7
              ..color = isDisabled
                  ? AppColorPhonetics.lightGreyColor4.withOpacity(0.5)
                  : AppColorPhonetics.darkBlueColor
              ..style = PaintingStyle.stroke,
          ),
        ),
      ],
    );
  }
}
