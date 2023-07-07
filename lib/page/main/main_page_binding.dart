import 'package:get/get.dart';
import 'package:thai_hymn/models/video_model.dart';

import 'main_page_controller.dart';
import 'main_page_model.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.log('[$runtimeType] build');
    // GetX 저장을 해서 어디서든지 꺼내 쓸 수가 있게 됨
    Get.put<MainPageController>(MainPageController(
      model: MainPageModel.empty().copyWith(
        orders: const ['Numerical', 'Alphabetical'],
        orderIndex: 0,
        items: const ['Both', 'Title', 'Lyric'],
        itemIndex: 0,
        videos: VideoModel.values(),
      ),
    ));
  }
}
