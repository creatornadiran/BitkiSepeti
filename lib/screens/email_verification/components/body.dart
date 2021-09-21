import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/screens/email_verification/components/WelcomeDialog.dart';
import 'package:e_commerce/screens/email_verification/components/verification_form.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Email Doğrulama",
                style: TextStyle(
                    fontSize: width * 0.1, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Lütfen Email Doğrulama için \nEmail'inize gelen tek kullanimlik kodu giriniz",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              VerificationForm(),
              SizedBox(
                height: height * 0.05,
              ),
              DefaultButton(
                text: "Devam Et",
                press: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreen.routeName, ModalRoute.withName('/'));
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => WelcomeDialog(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
