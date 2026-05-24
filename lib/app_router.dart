import 'package:flutter/material.dart';
import 'package:maplogix/business_logic/cubit/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:maplogix/presentation/screens/login_screen.dart';
import 'package:maplogix/presentation/screens/map_screen.dart';
import 'package:maplogix/presentation/screens/otp_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maplogix/constants/strings.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());

      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );

      case otpScreen:
        final phoneNumper = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,

            child: OtpScreen(phoneNumper: phoneNumper),
          ),
        );
    }
  }
}
