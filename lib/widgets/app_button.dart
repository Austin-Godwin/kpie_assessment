import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpie_assessment/utils/color.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isTransparent;
  final bool isPrimaryButton;
  const AppButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isTransparent = false,
    this.isPrimaryButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 47.73, vertical: 21.0),
      decoration: BoxDecoration(
        color: !isTransparent ? !isPrimaryButton ? AppColors.kBlack : AppColors.kBlue : AppColors.kWhite,
        borderRadius: BorderRadius.circular(15.0),
        border: !isTransparent
            ? const Border.symmetric(
                vertical: BorderSide.none,
                horizontal: BorderSide.none,
              )
            : Border.all(
                color: AppColors.kBlue,
              ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.aBeeZee(
            color: !isTransparent ? AppColors.kWhite : AppColors.kBlue,
            fontWeight: FontWeight.w400,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}

class ShortAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isStretched;
  // final bool isPrimaryButton;
  const ShortAppButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isStretched = false,
    // this.isPrimaryButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 11.0),
      decoration: BoxDecoration(
        color: AppColors.kLightBlue.withOpacity(0.199),
        borderRadius: BorderRadius.circular(8.0),
        // border: !isTransparent
        //     ? const Border.symmetric(
        //   vertical: BorderSide.none,
        //   horizontal: BorderSide.none,
        // )
        //     : Border.all(
        //   color: AppColors.kBlue,
        // ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.aBeeZee(
            // color: !isTransparent ? AppColors.kWhite : AppColors.kBlue,
            color: AppColors.kBlue,
            fontWeight: FontWeight.w400,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
