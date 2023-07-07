import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_hymn/app/app_model.dart';
import 'package:thai_hymn/util/util.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'detail_page_model.dart';

class DetailPageController extends GetControllerHelper<DetailPageModel> {
  DetailPageController({
    required DetailPageModel model,
  }) : super(model);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final RxDouble seek = 0.0.obs;
  final RxBool isPlaying = false.obs;

  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;

  @override
  void onInit() {
    super.onInit();
    WakelockPlus.enable();
    final appModel = appController?.value ?? AppModel.empty();

    videoPlayerController = VideoPlayerController.asset('assets/videofile/${state.video.name}.mp4');
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: appModel.option.looping,
      allowFullScreen: false,
      allowPlaybackSpeedChanging: false,
      playbackSpeeds: [1.0],
      showOptions: false,
      autoPlay: appModel.option.autoplay,
      showControlsOnInitialize: false,
      allowedScreenSleep: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );
    videoPlayerController.addListener(onListenVideo);
  }

  @override
  void onClose() {
    WakelockPlus.disable();
    videoPlayerController
      ..removeListener(onListenVideo)
      ..dispose();
    chewieController.dispose();
    super.onClose();
  }

  void onListenVideo() {
    seek.value = videoPlayerController.value.position.inMilliseconds.toDouble();
    isPlaying.value = videoPlayerController.value.isPlaying;
  }

  void onPressedBack() {
    Get.back();
  }

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void toggleVideoPlayerController() {
    videoPlayerController.value.isPlaying ? videoPlayerController.pause() : videoPlayerController.play();
  }

  void onChangedSlider(double value) {
    videoPlayerController.seekTo(Duration(milliseconds: value.toInt()));
  }
}
