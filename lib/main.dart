import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import 'di.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
 await initAppModule();
 if(kIsWeb) {
   setUrlStrategy(PathUrlStrategy());
 }

  runApp(const App());
}











