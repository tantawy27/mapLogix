// ignore_for_file: prefer_interpolation_to_compose_strings, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maplogix/business_logic/cubit/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:maplogix/constants/my_colors.dart';
import 'package:maplogix/constants/strings.dart';
import 'package:maplogix/presentation/screens/login_screen.dart';

class LoginWidgets extends StatelessWidget {
  final GlobalKey<FormState> phoneFormKey = GlobalKey();
  late String phoneNumper;
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget bulidIntroTexts() {
    return Column(
      children: [
        Text(
          "What Is Your Phone Numper?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 8),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Text("Please Inter Your Phone Numper to verify your account"),
        ),
      ],
    );
  }

  Widget buildPhoneFormField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.lightGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              generateCountryFlag() + " +20",
              style: TextStyle(fontSize: 18, letterSpacing: 2.0),
            ),
          ),
        ),
        SizedBox(width: 10),

        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              autofocus: true,
              style: TextStyle(fontSize: 18, letterSpacing: 2.0),
              decoration: InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType
                  .phone, //عشان ميجيبش حروف يجيب الارقام علطلول ع الكيبورد
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Phone Numper';
                } else if (value.length < 11) {
                  return 'Too Short phone Numper';
                }

                return null;
              },
              onSaved: (value) {
                phoneNumper = value!;
              },
            ),
          ),
        ),
      ],
    );
  }

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );
    return flag;
  }

  Future<void> register(BuildContext context) async {
    if (!phoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      phoneFormKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumper(phoneNumper);
    }
  }

  Widget buildNextButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showProgressIndicator(context);
          register(context);
        },
        child: Text(
          'next',
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

  Widget buildPhoneNumperSubmitedBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          return showProgressIndicator(context);
        }
        if (state is PhoneNumperSubmited) {
          Navigator.pop(context);
          Navigator.pushNamed(context, otpScreen, arguments: phoneNumper);
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

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
