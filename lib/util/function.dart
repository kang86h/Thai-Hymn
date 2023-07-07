import 'package:get/get.dart';
import 'package:thai_hymn/app/app_controller.dart';

AppController? get appController => Get.isRegistered<AppController>() ? Get.find<AppController>() : null;
