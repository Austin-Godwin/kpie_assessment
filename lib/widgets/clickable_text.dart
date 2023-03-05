import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpie_assessment/utils/color.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final VoidCallback onTap;
  final TextAlign? textAlign;
  final Color? textColor;
  const ClickableText({
    Key? key,
    required this.text,
    this.fontSize,
    required this.onTap,
    this.textAlign,
    this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.center,
        style: GoogleFonts.aBeeZee(
          fontWeight: FontWeight.w400,
          fontSize: fontSize ?? 15.0,
          color: textColor ?? AppColors.kkJellyBeanTransparent.withOpacity(0.8),
        ),
      ),
    );
  }
}
