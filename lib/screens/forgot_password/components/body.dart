import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Text(
              "Şifremi Unuttum",
              style:
                  TextStyle(fontSize: width * 0.1, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Şifre yenileme bağlantısı gönderebilmemiz için \n lütfen e-posta adresinizi giriniz.",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            ForgotPasswordForm(),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
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
            ),
            SizedBox(
              height: height * 0.02,
            ),
            FormError(errors: errors),
            SizedBox(
              height: height * 0.1,
            ),
            DefaultButton(
                text: "Devam Et",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    //Send mail to reset password
                  }
                  ;
                }),
          ],
        ));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: TextColor),
      gapPadding: 10,
    );
  }
}
