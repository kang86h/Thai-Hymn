import 'package:get/get.dart';
import 'package:thai_hymn/models/video_model.dart';

import 'detail_page_controller.dart';
import 'detail_page_model.dart';

class DetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.log('[$runtimeType] build');

    Get.put<DetailPageController>(DetailPageController(
      model: DetailPageModel.empty().copyWith(
        video: Get.arguments is VideoModel ? Get.arguments as VideoModel : null,
      ),
    ));
  }
}
