import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool isObsecure = false;
  bool rememberMe = false;
  final List<String> errors = [];
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: height * 0.02,
          ),
          buildPasswordFormField(isObsecure),
          SizedBox(
            height: height * 0.01,
          ),
          FormError(errors: errors),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                      activeColor: PrimaryColor,
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      }),
                  Text("Beni Hatırla"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: PrimaryColor,
                      value: isObsecure,
                      onChanged: (value) {
                        setState(() {
                          isObsecure = value!;
                        });
                      }),
                  Text("Şifreyi Göster"),
                ],
              ),
            ],
          ),
          DefaultButton(
              text: "Devam Et",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreen.routeName, ModalRoute.withName('/'));
                }
              }),
          SizedBox(
            height: height * 0.02,
          ),
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
            child: Text(
              "Şifremi Unuttum",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField(bool isObsecure) {
    return TextFormField(
      obscureText: !isObsecure,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8 || value.length == 0) {
          removeError(error: kShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8 && value.length > 0) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Şifre",
          hintText: "Şifrenizi giriniz",
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon:
              Icon(isObsecure ? Icons.lock_open : Icons.lock_outline_rounded)),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "E-posta",
          hintText: "E-posta adresinizi giriniz",
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          suffixIcon: Icon(Icons.mail_outlined)),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: TextColor),
      gapPadding: 10,
    );
  }
}
