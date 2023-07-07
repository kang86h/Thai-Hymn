import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:thai_hymn/page/app_drawer/app_drawer.dart';
import 'package:thai_hymn/page/detail/detail_page_app_bar.dart';

import '../../util/util.dart';
import 'detail_page_controller.dart';

class DetailPage extends GetViewHelper<DetailPageController> {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: controller?.scaffoldKey,
        body: appController.rx((appState) {
          final chewieWidget = (controller != null)
              //널체크 하지 않고 아래쪽에 !로 널체크만 하면 캔버스킷으로 렌더링시 웹에서 창 사이즈 늘이거나 줄일때 에러 발생.
              ? Chewie(
                  controller: controller!.chewieController,
                )
              : SizedBox();

          final sliderWidget = DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color(0xFF1CACE3),
                    Color(0xFF4286CD),
                  ]),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 8, offset: Offset(0.0, 8.0))
              ],
              border: Border.all(color: Color(0xFF1CACE3)),
              color: Color(0xFF1CACE3),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: controller?.toggleVideoPlayerController,
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      child: ObxValue<RxBool>((isPlaying) {
                        return Icon(
                          isPlaying.value
                              ? Icons.pause_circle_outline
                              : Icons.play_circle_outline,
                          size: 32,
                        );
                      }, controller!.isPlaying),
                    ),
                    Expanded(
                      child: ObxValue<RxDouble>((seek) {
                        return Slider(
                          onChanged: controller?.onChangedSlider,
                          min: 0,
                          max: controller!.videoPlayerController.value.duration
                              .inMilliseconds
                              .toDouble(),
                          value: seek.value,
                        );
                      }, controller!.seek),
                    ),
                  ],
                ),
              ),
            ),
          );

          return controller.rx((state) {
            final appBar = DetailPageAppBar(
              onPressedBack: controller?.onPressedBack,
              onPressedMenu: controller?.openEndDrawer,
              video: state.video,
              fontSize: appState.fontSize,
            );

            final textWidget = Text(
              state.video.lyricString,
              style: TextStyle(
                  fontFamily: 'angsana',
                  height: 1.5,
                  fontSize: appState.fontSize.lyric),
              textAlign: TextAlign.left,
            );
            final imageWidget = Image.asset(
              'assets/images/${state.video.name}I.png',
            );

            return OrientationBuilder(
              builder: (context, orientation) {
                if (orientation == Orientation.portrait) {
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

                  return Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (appState.modeType.videoMode) ...[
                            Opacity(opacity: 0, child: appBar),
                            (controller != null)
                                ? AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: chewieWidget,
                                  )
                                : SizedBox(),
                            //여기서도 널체크 하지 않으면 캔버스킷으로 렌더링시 모니터 옮겨갈때 웹에서 널펑션 에러 발생.
                          ],
                          if (appState.modeType.textMode) ...[
                            Opacity(opacity: 0, child: appBar),
                            Opacity(opacity: 0, child: sliderWidget),
                            Opacity(
                              opacity: 0,
                              child: LimitedBox(
                                maxHeight: 9,
                                child: (controller != null) ? chewieWidget : SizedBox(),
                              ),
                            ),
                          ],
                          if (appState.modeType.imageMode) ...[
                            Opacity(opacity: 0, child: appBar),
                            Opacity(opacity: 0, child: sliderWidget),
                            Opacity(
                              opacity: 0,
                              child: LimitedBox(
                                maxHeight: 9,
                                child: (controller != null) ? chewieWidget : SizedBox(),
                              ),
                            ),
                          ],
                          Expanded(
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification:
                                  (OverscrollIndicatorNotification overscroll) {
                                overscroll.disallowIndicator();
                                return false;
                              },
                              child: SingleChildScrollView(
                                child: (() {
                                  if (appState.modeType.videoMode ||
                                      appState.modeType.textMode) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: textWidget,
                                    );
                                  } else if (appState.modeType.imageMode) {
                                    return imageWidget;
                                  }

                                  return SizedBox();
                                })(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (appState.modeType.videoMode) ...[
                                appBar,
                              ],
                              if (appState.modeType.textMode) ...[
                                appBar,
                                sliderWidget,
                              ],
                              if (appState.modeType.imageMode) ...[
                                appBar,
                                sliderWidget,
                              ],
                            ],
                          )
                        ],
                      ),
                    ],
                  );
                } else {
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                      overlays: []);

                  if (appState.modeType.videoMode) {
                    return Stack(
                      children: [
                        (controller != null) ? chewieWidget : SizedBox(),
                        if (appState.option.alwaysShowAppBar) appBar,
                        //여기서도 널체크 하지 않으면 캔버스킷으로 렌더링시 모니터 옮겨갈때 웹에서 널펑션 에러 발생.
                      ],
                    );
                  }

                  return Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (appState.option.alwaysShowAppBar)
                            Opacity(opacity: 0, child: appBar),
                          Opacity(opacity: 0, child: sliderWidget),
                          Expanded(
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification:
                                  (OverscrollIndicatorNotification overscroll) {
                                overscroll.disallowIndicator();
                                return false;
                              },
                              child: SingleChildScrollView(
                                child: (() {
                                  if (appState.modeType.textMode) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: textWidget,
                                        ),
                                        Opacity(
                                          opacity: 0,
                                          child: LimitedBox(
                                            maxHeight: 9,
                                            child: (controller != null) ? chewieWidget : SizedBox(),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else if (appState.modeType.imageMode) {
                                    return Column(
                                      children: [
                                        imageWidget,
                                        Opacity(
                                          opacity: 0,
                                          child: LimitedBox(
                                            maxHeight: 9,
                                            child: (controller != null) ? chewieWidget : SizedBox(),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return SizedBox();
                                })(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (appState.option.alwaysShowAppBar) appBar,
                            sliderWidget,
                          ]),
                    ],
                  );
                }
              },
            );
          });
        }),
        endDrawer: AppDrawer(),
      ),
    );
  }
}
