import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpie_assessment/utils/color.dart';
import 'package:kpie_assessment/views/authentication/sign_up/sign_up.dart';
import 'package:kpie_assessment/widgets/app_button.dart';
import 'package:kpie_assessment/widgets/auth_appbar.dart';
import 'package:kpie_assessment/widgets/clickable_text.dart';
import 'package:kpie_assessment/widgets/user_input.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        children: [
          const AuthAppBar(text: 'Login'),
          const UserInput(
            text: 'Email / Username / Phone',
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 5.5),
          const UserInput(
            text: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 21.0),
          ClickableText(
            text: 'Forgot Password?',
            fontSize: 12.0,
            onTap: () {},
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 53.0),
          AppButton(
            text: 'Sign in My Account',
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
          const SizedBox(height: 22.0),
          ClickableText(
            text: 'Don’t have an account? - Sign Up',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUP(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
