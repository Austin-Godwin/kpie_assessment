import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpie_assessment/utils/color.dart';
import 'package:kpie_assessment/views/authentication/login/login.dart';
import 'package:kpie_assessment/views/authentication/sign_up/view_model/sign_up_view_model.dart';
import 'package:kpie_assessment/widgets/app_button.dart';
import 'package:kpie_assessment/widgets/auth_appbar.dart';
import 'package:kpie_assessment/widgets/clickable_text.dart';
import 'package:kpie_assessment/widgets/user_input.dart';

final _signUpViewModelProvider =
    ChangeNotifierProvider.autoDispose<SignUpViewModel>(
  (ref) => SignUpViewModel(),
);

class SignUP extends ConsumerWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(_signUpViewModelProvider);
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Form(
        key: model.form,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          children: [
            const AuthAppBar(text: "Sign up"),
            UserInput(
              text: 'Full Name',
              controller: model.fullName,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 5.5),
            UserInput(
              text: 'Email',
              controller: model.email,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 5.5),
            UserInput(
              text: 'Password',
              controller: model.password,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(height: 28.0),
            Row(
              children: [
                Checkbox(
                  value: model.isChecked,
                  onChanged: (v) => model.changeIsChecked(v!),

                ),
                Expanded(
                    child: Text(
                  'By creating your account you have to agree with our Teams and Conditions.',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 12.0,
                    color: AppColors.kkJellyBeanTransparent.withOpacity(0.8),
                  ),
                )
                    // ClickableText(
                    //   text: 'Be creating your account you have to agree with our Teams and Conditions.',
                    //   fontSize: 12.0,
                    //   onTap: () {},
                    //   textAlign: TextAlign.right,
                    // ),
                    ),
              ],
            ),
            const SizedBox(height: 53.0),
            AppButton(
              text: 'Sign up My Account',
              onTap: model.validate,
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
      ),
    );
  }
}
