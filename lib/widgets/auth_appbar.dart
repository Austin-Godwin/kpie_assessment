import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpie_assessment/utils/color.dart';

class AuthAppBar extends StatelessWidget {
  final String text;
  const AuthAppBar({Key? key, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 62.5),
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Stack(
              children: [
                const Icon(
                  Icons.arrow_back_sharp,
                  color: AppColors.kBlue,
                ),
                Positioned(
                  left: 20,
                  bottom: 11,
                  child: Container(
                    width: 10.25,
                    height: 2.0,
                    color: AppColors.kBlue,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 22.99),
        Text(
          text,
          style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              fontSize: 32.0,
              color: AppColors.kDarkJellyBean
          ),
        ),
        const SizedBox(height: 34.5),
      ],
    );
  }
}
