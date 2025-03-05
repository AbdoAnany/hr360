import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import 'core/routing/app_router.dart';
import 'di.dart';
final appRouter = AppRouter();
Future<void> main() async {
 await initAppModule();


 runApp(App(appRouter: appRouter));
}











