import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpie_assessment/utils/color.dart';
import 'package:kpie_assessment/views/authentication/login/login.dart';
import 'package:kpie_assessment/views/authentication/sign_up/sign_up.dart';
import 'package:kpie_assessment/widgets/app_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 64.0,
          ),
          Image.asset('assets/images/logo.png'),
          // Text(
          //   'Ronvest',
          //   style: GoogleFonts.aBeeZee(
          //     fontSize: 35.0,
          //     fontStyle: FontStyle.italic,
          //     fontWeight: FontWeight.bold,
          //     color: AppColors.kBlue,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          const SizedBox(
            height: 59.33,
          ),
          Container(
            width: 248,
            height: 248,
            clipBehavior: Clip.none,
            child: Image.asset('assets/images/pig_safe.png'),
          ),
          const SizedBox(
            height: 68,
          ),
          Text(
            'Save money the fun\nand easy way',
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              fontSize: 35.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
              color: AppColors.kBlue,
            ),
          ),
          const SizedBox(
            height: 79.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                text: 'Login',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                isPrimaryButton: true,
              ),
              const SizedBox(
                width: 5.86,
              ),
              AppButton(
                text: 'Sign up',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUP(),
                    ),
                  );
                },
                isTransparent: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
