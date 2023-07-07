import 'package:flutter/material.dart';
import 'package:thai_hymn/page/app_drawer/app_drawer.dart';
import 'package:thai_hymn/page/qna/qna_page_app_bar.dart';

import '../../util/util.dart';
import 'qna_page_controller.dart';

class QnAPage extends GetViewHelper<QnAPageController> {
  const QnAPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: controller?.scaffoldKey,
        body: appController.rx((appState) {
          return controller.rx((state) {
            final appBar = QnAPageAppBar(
              onPressedBack: controller?.onPressedBack,
              onPressedMenu: controller?.openEndDrawer,
              fontSize: appState.fontSize,
            );

            final textWidget = Text(
              state.qna.qnatext,
              style: TextStyle(fontFamily: 'angsana', height: 2.0, fontSize: appState.fontSize.lyric),
              textAlign: TextAlign.left,
            );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                appBar,
                Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: textWidget,
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
        }),
        endDrawer: AppDrawer(),
      ),
    );
  }
}
