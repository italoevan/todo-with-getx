import 'package:get/get.dart';
import 'package:to_do_getx/features/home/navigator/home_navigator.dart';
import 'package:to_do_getx/features/home/screens/home_screen/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeControllerImpl>(() => HomeControllerImpl());
    Get.lazyPut(() => HomeNavigatorImpl());
  }
}
