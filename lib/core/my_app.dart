import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/core/values/app_pages.dart';
import 'package:to_do_getx/core/values/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
