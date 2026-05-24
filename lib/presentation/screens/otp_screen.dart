import 'package:flutter/material.dart';
import 'package:maplogix/presentation/widgets/otp_widgets.dart';

class OtpScreen extends StatelessWidget {
  final phoneNumper;

  const OtpScreen({super.key, this.phoneNumper});

  @override
  Widget build(BuildContext context) {
    final otpWidgets = OtpWidgets();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 38),
          child: Column(
            children: [
              otpWidgets.bulidIntroTexts(),
              SizedBox(height: 40),
              otpWidgets.buildPinCodeFields(),
              SizedBox(height: 40),
              otpWidgets.buildVerifyButton(context),
              otpWidgets.buildPhoneVerificationBloc(),
            ],
          ),
        ),
      ),
    );
  }
}
