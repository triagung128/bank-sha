import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/data_package_page.dart';
import 'package:bank_sha/ui/pages/data_provider_page.dart';
import 'package:bank_sha/ui/pages/data_success_page.dart';
import 'package:bank_sha/ui/pages/home_page.dart';
import 'package:bank_sha/ui/pages/onboarding_page.dart';
import 'package:bank_sha/ui/pages/pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_success_page.dart';
import 'package:bank_sha/ui/pages/profile_page.dart';
import 'package:bank_sha/ui/pages/sign_in_page.dart';
import 'package:bank_sha/ui/pages/sign_up_page.dart';
import 'package:bank_sha/ui/pages/sign_up_success_page.dart';
import 'package:bank_sha/ui/pages/splash_page.dart';
import 'package:bank_sha/ui/pages/topup_page.dart';
import 'package:bank_sha/ui/pages/topup_success_page.dart';
import 'package:bank_sha/ui/pages/transfer_page.dart';
import 'package:bank_sha/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (_) => UserBloc(),
        ),
      ],
      child: MaterialApp(
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
          '/sign-up-success': (_) => const SignUpSuccessPage(),
          '/home': (_) => const HomePage(),
          '/profile': (_) => const ProfilePage(),
          '/pin': (_) => const PinPage(),
          '/profile-edit': (_) => const ProfileEditPage(),
          '/profile-edit-pin': (_) => const ProfileEditPinPage(),
          '/profile-edit-success': (_) => const ProfileEditSuccessPage(),
          '/topup': (_) => const TopupPage(),
          '/topup-success': (_) => const TopupSuccessPage(),
          '/transfer': (_) => const TransferPage(),
          '/transfer-success': (_) => const TransferSuccessPage(),
          '/data-provider': (_) => const DataProviderPage(),
          '/data-package': (_) => const DataPackagePage(),
          '/data-success': (_) => const DataSuccessPage(),
        },
      ),
    );
  }
}
