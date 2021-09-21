import 'package:e_commerce/screens/splash/components/body.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SplashScreen extends StatelessWidget {
  static String routName = 'Splash';
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SplashBody(),
    );
  }
}
