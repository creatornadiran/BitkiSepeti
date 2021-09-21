import 'package:flutter/material.dart';

import '../../../constants.dart';

class WelcomeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 230,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      'Hoş Geldiniz!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Fırsatlarla dolu BitkiSepeti'ne hoş geldiniz.",
                      style: TextStyle(fontSize: 19),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(PrimaryColor)),
                      child: Text(
                        "Devam",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -45,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Icon(
                      Icons.local_florist_rounded,
                      color: PrimaryColor,
                      size: 100,
                    ))),
          ],
        ));
  }
}
