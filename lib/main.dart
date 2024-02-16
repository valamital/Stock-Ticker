import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_ticker/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en', 'US'),

      ///set initial route
      initialRoute: AppRoutes.splashScreen,

      /// Define routes and corresponding page widgets
      getPages: AppRoutes.pages,
    );
  }
}
