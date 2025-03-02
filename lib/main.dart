import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import 'core/routing/app_router.dart';
import 'di.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
final appRouter = AppRouter();
Future<void> main() async {
 await initAppModule();
 // if(kIsWeb) {
 //   setUrlStrategy( const PathUrlStrategy());
 // }



 runApp(App(appRouter: appRouter));
}











