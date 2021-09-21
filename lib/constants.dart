import 'package:flutter/material.dart';

const PrimaryColor = Color(0xFF0c9869);
const SecondaryColor1 = Color(0xFF85cbb3);
const SecondaryColor2 = Color(0xFFCEE5D0);
const TextColor = Color(0xFF0B0B0B);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Lütfen e-posta adresinizi girin";
const String kInvalidEmailError = "Lütfen geçerli bir e-posta adresi girin";
const String kPassNullError = "Lütfen şifrenizi girin";
const String kShortPassError = "Şifreniz çok kısa";
const String kInfoNullError = "Lütfen tüm bilgileri eksiksiz girin";
const String kPhoneNumberNullError = "Lütfen telefon numaranızı girin";
const String kAddressNullError = "Lütfen adresinizi girin";
const String kAnyNullError = "Lütfen boş alanları doldurunuz";
const String kOTPError = "Lütfen eksiksiz giriniz";

late double height;
late double width;

final VerificationDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 15),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
    counterText: '');

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: TextColor),
  );
}
