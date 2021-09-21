import 'package:flutter/material.dart';

import '../constants.dart';

PreferredSize buildCustomAppBar(
    {required BuildContext context, String? title = null, int numOfItems = 0}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: AppBar(
      centerTitle: true,
      title: title == null
          ? null
          : Column(
              children: [
                Text(
                  title,
                  style: TextStyle(color: PrimaryColor, fontSize: 25),
                ),
                Text("${numOfItems} ürün")
              ],
            ),
      backgroundColor: SecondaryColor1.withOpacity(0.5),
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
            )),
      ),
    ),
  );
}
