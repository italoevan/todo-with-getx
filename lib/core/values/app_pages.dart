import 'package:get/get.dart';
import 'package:to_do_getx/core/values/routes.dart';
import 'package:to_do_getx/features/home/home_bindings.dart';
import 'package:to_do_getx/features/home/screens/home_screen/home_controller.dart';
import 'package:to_do_getx/features/home/screens/home_screen/home_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      binding: HomeBindings(),
      name: Routes.home,
      page: () => HomeScreen(
        controller: Get.find<HomeControllerImpl>(),
      ),
    )
  ];
}
