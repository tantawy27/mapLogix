import 'package:flutter/material.dart';
import 'package:maplogix/presentation/widgets/login_widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginWidgets = LoginWidgets();
    return SafeArea(
      //عشان اضمن انو مش هيجي ناحية البار اللي فوق
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          // good at error handling
          key: loginWidgets.phoneFormKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loginWidgets.bulidIntroTexts(),
                SizedBox(height: 90),
                loginWidgets.buildPhoneFormField(),
                SizedBox(height: 20),
                loginWidgets.buildNextButton(context),
                loginWidgets.buildPhoneNumperSubmitedBloc(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
