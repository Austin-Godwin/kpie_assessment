import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kpie_assessment/utils/color.dart';
import 'package:kpie_assessment/utils/validator.dart';
import 'package:kpie_assessment/views/authentication/login/view_model/login_view_model.dart';
import 'package:kpie_assessment/widgets/app_button.dart';
import 'package:kpie_assessment/widgets/auth_appbar.dart';
import 'package:kpie_assessment/widgets/clickable_text.dart';
import 'package:kpie_assessment/widgets/loader_pager.dart';
import 'package:kpie_assessment/widgets/user_input.dart';

final _loginViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoginViewModel>(
  (ref) => LoginViewModel(),
);

class Login extends ConsumerWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(_loginViewModelProvider);
    return LoaderPage(
      isBusy: model.isBusy,
      child: Scaffold(
        backgroundColor: AppColors.kWhite,
        body: Form(
          key: model.form,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            children: [
              const AuthAppBar(text: 'Login'),
              UserInput(
                text: 'User Name',
                controller: model.userName,
                textInputType: TextInputType.text,
                validator: (v) => Validators.fullName(v),
              ),
              const SizedBox(height: 5.5),
              UserInput(
                text: 'Password',
                controller: model.password,
                obscureText: true,
                validator: (v) => Validators.password("password", v),
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
                onTap: model.validate,
                isPrimaryButton: true,
              ),
              const SizedBox(height: 22.0),
              ClickableText(
                text: 'Don’t have an account? - Sign Up',
                onTap: model.navToSignUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
