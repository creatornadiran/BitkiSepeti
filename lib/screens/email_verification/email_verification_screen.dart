import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/email_verification/components/body.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  static String routeName = "/email_verification";
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Email Doğrulama"),
        leading: SizedBox(
          width: width * 0.1,
          height: width * 0.1,
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
