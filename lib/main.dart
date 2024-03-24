import 'package:flutter/material.dart';
import '../app.dart';
import 'di.dart';



Future<void> main() async {
 await initAppModule();
  runApp(const App());
}

