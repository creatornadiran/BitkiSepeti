import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class PaymentBar extends StatelessWidget {
  const PaymentBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCart = Provider.of<UserCart>(context);
    return Container(
      height: 100,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 6,
            blurRadius: 8,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toplam: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(userCart.calculateTotal().toStringAsFixed(2) + "TL"),
                ],
              ),
            ),
            DefaultButton(
              text: 'Alışverişi Tamamla',
              buttonWidth: 30,
              textFontSize: 15,
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
