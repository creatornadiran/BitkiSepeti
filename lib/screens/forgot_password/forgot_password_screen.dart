import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/forgot_password/components/body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Şifremi Unuttum"),
        leading: SizedBox(
          height: width * 0.1,
          width: width * 0.1,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: PrimaryColor,
            ),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
