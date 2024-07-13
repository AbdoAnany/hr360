import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(
            Icons.email_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
          hintText: "Enter your email",
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email address';
          }
          // You can add more sophisticated email validation if needed
          if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
              .hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
      ),
    );
  }
}
