import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_hymn/page/app_drawer/app_drawer.dart';

import '../../util/util.dart';
import 'main_page_controller.dart';

class MainPage extends GetViewHelper<MainPageController> {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //safearea가 scaffold 위에 있어야 status bar 색상이 정상적으로 적용됨. scaffold 아래에 있으면 native 색상이 덮고있음
      child: Scaffold(
        backgroundColor: Colors.white,
        key: controller?.scaffoldKey,
        body: GestureDetector(
          onTapDown: (_) => Get.focusScope?.unfocus(),
          child: appController.rx((appState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Color(0xFF1CACE3),
                  child: Row(
                    children: [
                      IconButton(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: controller?.openDrawer,
                        padding: const EdgeInsets.only(left: 16),
                        icon: Icon(
                          Icons.menu,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Thai Hymn',
                          style: TextStyle(
                            fontSize: appState.fontSize.appBarTitle,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          controller!.isSearchBar.value =
                              !controller!.isSearchBar.value;
                        },
                        icon: Icon(
                          Icons.search,
                          size: 32,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(right: 16),
                      ),
                    ],
                  ),
                ),
                ObxValue<Rx<bool>>((isSearchBar) {
                  return Visibility(
                    visible: isSearchBar.value,
                    child: DecoratedBox(
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
                                color: Colors.grey,
                                blurRadius: 8,
                                offset: Offset(0.0, 8.0))
                          ],
                          border: Border.all(color: Color(0xFF1CACE3)),
                          color: Color(0xFF1CACE3),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20)),
                                  border: Border.all(color: Color(0xFF1CACE3)),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                child: DropdownButtonHideUnderline(
                                  child: SizedBox(
                                    height: appState.fontSize.drawerMain,
                                    child: controller.rx((state) {
                                      return DropdownButton<String>(
                                        iconSize: 24,
                                        onChanged: controller?.onChangedOrder,
                                        value: state.order,
                                        items: [
                                          ...state.orders
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) =>
                                                      DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                            fontSize: appState
                                                                .fontSize
                                                                .drawerSub,
                                                            height: 1.0,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: TextField(
                                    controller:
                                        controller?.textEditingController,
                                    style: TextStyle(
                                      textBaseline: TextBaseline.alphabetic,
                                      fontSize: appState.fontSize.drawerSub,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8),
                                      hintText: 'Search Text',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: appState.fontSize.drawerSub,
                                        height: 1.0,
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.text,
                                    cursorHeight: appState.fontSize.cursor,
                                  ),
                                ),
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(20)),
                                border: Border.all(color: Color(0xFF1CACE3)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                child: DropdownButtonHideUnderline(
                                  child: SizedBox(
                                    height: appState.fontSize.drawerMain,
                                    child: controller.rx((state) {
                                      return DropdownButton<String>(
                                        iconSize: 24,
                                        onChanged: controller?.onChangedItem,
                                        value: state.item,
                                        items: [
                                          ...state.items
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) =>
                                                      DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                            fontSize: appState
                                                                .fontSize
                                                                .drawerSub,
                                                            height: 1.0,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }, controller!.isSearchBar),
                Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();
                      return false;
                    },
                    child: controller.rx((state) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = state.videos.elementAt(index);
                          final video = item.copyWith(
                            title: '${item.title}',
                          );

                          return ListTile(
                            onTap: () {
                              Get.focusScope?.unfocus();
                              controller?.onPushDetail(video);
                            },
                            title: Text(
                              video.title,
                              style: TextStyle(
                                fontFamily: 'angsana',
                                fontSize: appState.fontSize.title,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1,
                            height: 1,
                            color: Color(0xFF1CACE3),
                          );
                        },
                        itemCount: state.videos.length,
                      );
                    }),
                  ),
                ),
              ],
            );
          }),
        ),
        drawer: AppDrawer(),
        endDrawer: AppDrawer(),
      ),
    );
  }
}
