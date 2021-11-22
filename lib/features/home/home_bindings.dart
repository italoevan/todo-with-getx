import 'package:get/get.dart';
import './home_exports.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeControllerImpl(Get.find()));
    Get.lazyPut<HomeNavigator>(() => HomeNavigatorImpl());
  }
}
