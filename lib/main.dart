import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/home_page.dart';
import 'package:bank_sha/ui/pages/onboarding_page.dart';
import 'package:bank_sha/ui/pages/pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_success_page.dart';
import 'package:bank_sha/ui/pages/profile_page.dart';
import 'package:bank_sha/ui/pages/sign_in_page.dart';
import 'package:bank_sha/ui/pages/sign_up_page.dart';
import 'package:bank_sha/ui/pages/sign_up_set_ktp_page.dart';
import 'package:bank_sha/ui/pages/sign_up_set_profile_page.dart';
import 'package:bank_sha/ui/pages/sign_up_success_page.dart';
import 'package:bank_sha/ui/pages/splash_page.dart';
import 'package:bank_sha/ui/pages/topup_amount_page.dart';
import 'package:bank_sha/ui/pages/topup_page.dart';
import 'package:bank_sha/ui/pages/topup_success_page.dart';
import 'package:bank_sha/ui/pages/transfer_amount_page.dart';
import 'package:bank_sha/ui/pages/transfer_page.dart';
import 'package:bank_sha/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: blackColor),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      routes: {
        '/': (_) => const SplashPage(),
        '/onboarding': (_) => const OnboardingPage(),
        '/sign-in': (_) => const SignInPage(),
        '/sign-up': (_) => const SignUpPage(),
        '/sign-up-set-profile': (_) => const SignUpSetProfilePage(),
        '/sign-up-set-ktp': (_) => const SignUpSetKtpPage(),
        '/sign-up-success': (_) => const SignUpSuccessPage(),
        '/home': (_) => const HomePage(),
        '/profile': (_) => const ProfilePage(),
        '/pin': (_) => const PinPage(),
        '/profile-edit': (_) => const ProfileEditPage(),
        '/profile-edit-pin': (_) => const ProfileEditPinPage(),
        '/profile-edit-success': (_) => const ProfileEditSuccessPage(),
        '/topup': (_) => const TopupPage(),
        '/topup-amount': (_) => const TopupAmountPage(),
        '/topup-success': (_) => const TopupSuccessPage(),
        '/transfer': (_) => const TransferPage(),
        '/transfer-amount': (_) => const TransferAmountPage(),
        '/transfer-success': (_) => const TransferSuccessPage(),
      },
    );
  }
}
