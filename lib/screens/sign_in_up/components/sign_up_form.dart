import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:e_commerce/screens/email_verification/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String name;
  late String surname;
  late String adress;
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
          Row(
            children: [
              Flexible(child: buildNameFormField()),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(child: buildSurnameFormField())
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          buildEmailFormField(),
          SizedBox(
            height: height * 0.01,
          ),
          buildPasswordFormField(isObsecure),
          SizedBox(
            height: height * 0.01,
          ),
          FormError(errors: errors),
          SizedBox(
            height: height * 0.01,
          ),
          DefaultButton(
              text: "Devam Et",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pushNamed(
                      context, EmailVerificationScreen.routeName);
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kInfoNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kInfoNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "İsim",
        hintText: "İsminiz",
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  TextFormField buildSurnameFormField() {
    return TextFormField(
      onSaved: (newValue) => surname = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kInfoNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kInfoNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Soyisim",
        hintText: "Soyisminiz",
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  TextFormField buildPasswordFormField(bool isObsecure) {
    return TextFormField(
      obscureText: !isObsecure,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kInfoNullError);
        }
        if (value.length >= 8 || value.length == 0) {
          removeError(error: kShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kInfoNullError);
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
          removeError(error: kInfoNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kInfoNullError);
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
