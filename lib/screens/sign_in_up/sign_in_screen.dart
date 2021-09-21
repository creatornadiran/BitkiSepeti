import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SignScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'BitkiSepeti',
          style: TextStyle(
              fontSize: 40, color: PrimaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SignBody(),
    );
  }
}
