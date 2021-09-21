import 'package:e_commerce/screens/sign_in_up/components/sign_in_form.dart';
import 'package:e_commerce/screens/sign_in_up/components/sign_up_form.dart';
import 'package:e_commerce/screens/sign_in_up/components/social_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignBody extends StatefulWidget {
  const SignBody({Key? key}) : super(key: key);

  @override
  _SignBodyState createState() => _SignBodyState();
}

class _SignBodyState extends State<SignBody> {
  bool signup = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.1),
              child: Container(
                alignment: Alignment.center,
                width: 260.0,
                height: 45.0,
                decoration: const BoxDecoration(
                  color: Color(0x552B2B2B),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 35,
                      child: Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                signup ? Colors.transparent : SecondaryColor1),
                          ),
                          onPressed: () {
                            setState(() {
                              signup = false;
                            });
                          },
                          child: Text(
                            'Giriş Yap',
                            style: TextStyle(
                                color: TextColor,
                                fontSize: 16.0,
                                fontFamily: 'WorkSansSemiBold'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      child: Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                signup ? SecondaryColor1 : Colors.transparent),
                          ),
                          onPressed: () {
                            setState(() {
                              signup = true;
                            });
                          },
                          child: Text(
                            'Kayıt Ol',
                            style: TextStyle(
                                color: TextColor,
                                fontSize: 16.0,
                                fontFamily: 'WorkSansSemiBold'),
                          ),
                        ),
                      ),
                    ),
                    //Container(height: 33.0, width: 1.0, color: Colors.white),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01, horizontal: width * 0.05),
                child: signup ? SignUpForm() : SignInForm()),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [SecondaryColor1, Colors.white])),
                  child: Column(
                    children: [
                      Text(
                        signup
                            ? "Sosyal Hesabınız ile Kaydolun"
                            : "Sosyal Hesabınız ile Giriş Yapın",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialCard(
                            icon: "assets/icons/facebook.svg",
                            press: () {},
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          SocialCard(
                            icon: "assets/icons/google.svg",
                            press: () {},
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          SocialCard(
                            icon: "assets/icons/twitter.svg",
                            press: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
