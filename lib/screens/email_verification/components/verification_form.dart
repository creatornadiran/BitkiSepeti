import 'package:flutter/material.dart';

import '../../../constants.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({Key? key}) : super(key: key);

  @override
  _VerificationFormState createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  FocusNode? FocusNode2;
  FocusNode? FocusNode3;
  FocusNode? FocusNode4;
  bool error = false;
  @override
  void initState() {
    super.initState();
    FocusNode2 = FocusNode();
    FocusNode3 = FocusNode();
    FocusNode4 = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    FocusNode2!.dispose();
    FocusNode3!.dispose();
    FocusNode4!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  bool resend = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSizedBox(width, focusNode2: FocusNode2!),
              buildSizedBox(width,
                  focusNode1: FocusNode2!, focusNode2: FocusNode3!),
              buildSizedBox(width,
                  focusNode1: FocusNode3!, focusNode2: FocusNode4!),
              buildSizedBox(width, last: true, focusNode1: FocusNode4!),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          GestureDetector(
            onTap: () {
              //Re send
              setState(() {
                resend = true;
              });
            },
            child: Text(
              "Tekrar Gönder",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: SizedBox(
              height: 15,
              width: width * 0.7,
              child: resend
                  ? Text(
                      "Tekrar gönderildi lütfen email'inizi kontrol edin",
                      style: TextStyle(fontSize: width * 0.03),
                      textAlign: TextAlign.center,
                    )
                  : Text(""),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildSizedBox(double width,
      {bool last = false, FocusNode? focusNode1, FocusNode? focusNode2}) {
    return SizedBox(
      width: width * 0.15,
      child: TextFormField(
        maxLength: 1,
        focusNode: focusNode1,
        autofocus: true,
        obscureText: true,
        style: TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: VerificationDecoration,
        onChanged: (value) {
          error = false;
          last ? () {} : nextField(value, focusNode2);
        },
        validator: (value) {
          if (value!.isEmpty) {
            error = true;
            return "";
          }
          return null;
        },
      ),
    );
  }
}
