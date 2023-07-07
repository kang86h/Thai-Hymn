import 'package:get/get.dart';
import 'package:thai_hymn/models/qna_model.dart';

import 'qna_page_controller.dart';
import 'qna_page_model.dart';

// DI = Dependency Injection(의존성 주입)
// 데이터를 모듈 밖에서 넣어주는 것
// - 나중에 유지보수, 테스트라던지 의존성을 좀 떨어뜨릴 수 있음
class QnAPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.log('[$runtimeType] build');

    Get.put<QnAPageController>(QnAPageController(
      model: QnAPageModel.empty().copyWith(
        qna: QnAModel.text(),
      ),
    ));
  }
}
