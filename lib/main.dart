import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kpie_assessment/core/services/navigation.dart';
import 'package:kpie_assessment/views/authentication/login/login.dart';
import 'package:kpie_assessment/views/authentication/sign_up/sign_up.dart';
import 'package:kpie_assessment/views/onboarding/onboarding.dart';
import 'package:kpie_assessment/views/profile/profile.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigation.instance.navigatorKey,
      routes: {
        "/": (context) => const Onboarding(),
        "/profileView": (context) => const Profile(),
        "/loginView": (context) => const Login(),
        "/registerView": (context) => const SignUP(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Onboarding(),
    );
  }
}
