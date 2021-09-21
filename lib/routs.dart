import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/details/detail_screen.dart';
import 'package:e_commerce/screens/email_verification//email_verification_screen.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/sign_in_up/sign_in_screen.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routName: (context) => SplashScreen(),
  SignScreen.routeName: (context) => SignScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  EmailVerificationScreen.routeName: (context) => EmailVerificationScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailScreen.routName: (context) => DetailScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
