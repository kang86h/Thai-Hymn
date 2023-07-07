import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_hymn/util/util.dart';

import 'qna_page_model.dart';

class QnAPageController extends GetControllerHelper<QnAPageModel> {
  QnAPageController({
    required QnAPageModel model,
  }) : super(model);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onPressedBack() {
    Get.back();
  }

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    final context = scaffoldKey.currentContext;

    if (context != null) {
      Navigator.of(context).pop();
    }
  }
}
