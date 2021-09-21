import 'package:flutter/material.dart';

import '../constants.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => formErrorText(error: errors[index])));
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Icon(
          Icons.error_outline_sharp,
          size: height * 0.03,
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Text(error)
      ],
    );
  }
}
