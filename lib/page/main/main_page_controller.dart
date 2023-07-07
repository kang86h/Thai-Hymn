import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_hymn/models/video_model.dart';
import 'package:thai_hymn/util/util.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'main_page_model.dart';

class MainPageController extends GetControllerHelper<MainPageModel> {
  MainPageController({
    required MainPageModel model,
  }) : super(model);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController textEditingController = TextEditingController();

  final RxBool isSearchBar = false.obs;

  @override
  void onInit() {
    super.onInit();
    WakelockPlus.enable();
    textEditingController.addListener(onListenText);
  }

  @override
  void onClose() {
    WakelockPlus.disable();
    textEditingController
      ..removeListener(onListenText)
      ..dispose();
    super.onClose();
  }

  void onListenText() {
    final text = textEditingController.value.text;
    final videos = (() {
      if (state.itemIndex == 0) {
        return VideoModel.values().where((video) => video.title.contains(text) || video.lyricString.contains(text));
      } else if (state.itemIndex == 1) {
        return VideoModel.values().where((video) => video.title.contains(text));
      } else if (state.itemIndex == 2) {
        return VideoModel.values().where((video) => video.lyricString.contains(text));
      }

      return VideoModel.values();
    })()
        .toList();

    if (state.orderIndex == 0) {
      change(state.copyWith(
        videos: videos,
      ));
    } else if (state.orderIndex == 1) {
      change(state.copyWith(
        videos: videos..sort((a, c) => a.title.split('.')[1].compareTo(c.title.split('.')[1])),
      ));
    }
  }

  void onChangedOrder(String? order) {
    if (order != null) {
      change(state.copyWith(
        orderIndex: state.orders.toList().indexOf(order),
      ));
      onListenText();
    }
  }

  void onChangedItem(String? item) {
    if (item != null) {
      change(state.copyWith(
        itemIndex: state.items.toList().indexOf(item),
      ));
      onListenText();
    }
  }

  void onPushDetail(VideoModel video) async {
    await Get.toNamed('/detail', arguments: video);
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void changeVideos(Iterable<VideoModel> videos) {
    change(state.copyWith(
      videos: videos,
    ));
  }

  void closeDrawer() {
    final context = scaffoldKey.currentContext;

    if (context != null) {
      Navigator.of(context).pop();
    }
  }
}
