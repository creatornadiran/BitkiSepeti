import 'package:flutter/material.dart';

import '../../../constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title, required this.press})
      : super(key: key);
  final String title;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: width * 0.05, color: Colors.black),
          ),
          GestureDetector(
            child: Text("Daha fazla"),
            onTap: press,
          )
        ],
      ),
    );
  }
}
