import 'package:flutter/material.dart';
import 'package:kpie_assessment/utils/color.dart';
import 'package:kpie_assessment/views/authentication/login/login.dart';
import 'package:kpie_assessment/widgets/app_button.dart';
import 'package:kpie_assessment/widgets/auth_appbar.dart';
import 'package:kpie_assessment/widgets/clickable_text.dart';
import 'package:kpie_assessment/widgets/user_input.dart';

class SignUP extends StatelessWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        children: [
          const AuthAppBar(text: "Sign up"),
          const UserInput(
            text: 'Full Name',
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 5.5),
          const UserInput(
            text: 'Email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 5.5),
          const UserInput(
            text: 'Password',
            textInputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 28.0),
          Row(
            children: [
              ClickableText(
                text: 'Forgot Password?',
                fontSize: 12.0,
                onTap: () {},
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(height: 53.0),
          AppButton(
            text: 'Sign up My Account',
            onTap: () {},
          ),
          const SizedBox(height: 7.0),
          AppButton(
            text: 'Sign up with phone number',
            onTap: () {},
            isPrimaryButton: true,
          ),
          const SizedBox(height: 22.0),
          ClickableText(
            text: 'Already have an account? - Sign In',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
