import 'package:flutter/material.dart';
import 'package:hr360/features/2_dash_border/core_import.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

 @override
 Widget build(BuildContext context) {
  return Container(
      decoration: AppStyle.decorationPage,
      child: Center(child: Text("Accounts")));
 }
}
