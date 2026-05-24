import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maplogix/business_logic/cubit/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:maplogix/constants/my_colors.dart';
import 'package:maplogix/constants/strings.dart';
import 'package:maplogix/presentation/widgets/login_widgets.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpWidgets extends StatelessWidget {
  final phoneNumper;
  late String otpCode;

  OtpWidgets({super.key, this.phoneNumper});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget bulidIntroTexts() {
    return Column(
      children: [
        Text(
          "Verify Your Phone Numper?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 8),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: 'Please Enter Your 6 digit code Numpers sent to ',
              style: TextStyle(color: Colors.black, height: 1.4, fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                  text: '$phoneNumper',
                  style: TextStyle(color: MyColors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPinCodeFields() {
    return MaterialPinField(
      autoFocus: true,
      keyboardType: TextInputType.number,
      length: 6,
      theme: MaterialPinTheme(
        fillColor: MyColors.lightGrey,
        focusedFillColor: MyColors.lightBlue,
        borderColor: MyColors.blue,
        cellSize: Size(45, 64),
        borderRadius: BorderRadius.circular(12),
        shape: MaterialPinShape.outlined,
      ),
      onCompleted: (submittedCode) => otpCode = submittedCode,
      onChanged: (value) => print('Changed: $value'),
    );
  }

  void login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).submitOtp(otpCode);
  }

  Widget buildVerifyButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          LoginWidgets().showProgressIndicator(context);
          login(context);
        },
        child: Text(
          'Verify',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(110, 50),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6),
          ),
        ),
      ),
    );
  }

  Widget buildPhoneVerificationBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          return LoginWidgets().showProgressIndicator(context);
        }
        if (state is PhoneOtpVerifed) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(mapScreen);
        }

        if (state is ErrorOccurred) {
          Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMsg), duration: Duration(seconds: 5)),
          );
        }
      },
      child: Container(),
    );
  }
}
