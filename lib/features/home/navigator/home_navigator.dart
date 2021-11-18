import 'package:get/get.dart';
import 'package:to_do_getx/core/values/routes.dart';

abstract class HomeNavigator {
  void navigateToMenu();
}

class HomeNavigatorImpl implements HomeNavigator {
  @override
  void navigateToMenu() {
    Get.toNamed(Routes.home);
  }
}
