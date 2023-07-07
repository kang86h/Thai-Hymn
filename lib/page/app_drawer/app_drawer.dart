import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_hymn/models/font_size_model.dart';
import 'package:thai_hymn/models/only_mode_model.dart';

import '../../../util/util.dart';
import '../../pref_helper.dart';

const Map<String, double> _toggleMap = {
  'S': 20,
  'M': 28,
  'L': 36,
};

const Iterable<String> _toggleList = ['Text', 'Image', 'Video'];

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);

  final Rx<bool> isSettings = false.obs;

  final RxInt fontSize = 0.obs;
  final RxInt modeType = 0.obs;

  @override
  Widget build(BuildContext context) {
    return appController.rx((appState) {
      fontSize.value = FontSizeModel.values().toList().indexWhere((x) => x == appState.fontSize);
      modeType.value = OnlyModeModel.values().toList().indexWhere((x) => x == appState.modeType);

      return Drawer(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: Image.asset(
                  'assets/images/drawer.png',
                ),
                accountName: Text('WELC thai Hymn 0.0.1'),
                accountEmail: Text('kang86h@gmail.com'),
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [
                    Color(0xFF1CACE3),
                    Color(0xFF4286CD),
                  ]),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0.0, 4.0))],
                  color: Color(0xFF1CACE3),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
              ),
              Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: ListTile(
                  onTap: () {
                    isSettings.value = !isSettings.value;
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey[850],
                  ),
                  title: Text(
                    'Setting',
                    style: TextStyle(fontSize: appState.fontSize.drawerMain),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down,
                    size: 36,
                  ),
                ),
              ),
              ObxValue<Rx<bool>>((isSettings) {
                return isSettings.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ...PrefType.values.take(3).expand((x) => [
                                UI.dividerBlue,
                                Theme(
                                  data: ThemeData(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                  ),
                                  child: SwitchListTile(
                                    onChanged: (value) => appController?.changePrefType(x, value),
                                    title: Text(
                                      x.text,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: appState.fontSize.drawerSub,
                                      ),
                                    ),
                                    value: {
                                          PrefType.autoplay: appState.option.autoplay,
                                          PrefType.looping: appState.option.looping,
                                          PrefType.alwaysShowAppBar: appState.option.alwaysShowAppBar,
                                        }[x] ??
                                        false,
                                  ),
                                ),
                              ]),
                          UI.dividerBlue,
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Mode',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: appState.fontSize.drawerSub,
                                  ),
                                ),
                              ),
                              ObxValue<RxInt>((index) {
                                final isSelected = List.generate(3, (i) => i == index.value);

                                return ToggleButtons(
                                  onPressed: (int newIndex) {
                                    modeType.value = newIndex;
                                    appController?.changeModeType(newIndex);
                                  },
                                  isSelected: isSelected,
                                  color: Colors.black,
                                  selectedColor: Colors.white,
                                  selectedBorderColor: Color(0xFF4286CD),
                                  fillColor: Color(0xFF1CACE3),
                                  highlightColor: Colors.blue[200],
                                  borderWidth: 2,
                                  borderColor: Color(0xFF4286CD),
                                  borderRadius: BorderRadius.circular(50),
                                  children: [
                                    ..._toggleList.map((x) => Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Text(
                                            x,
                                            style: TextStyle(
                                              fontSize: appState.fontSize.drawerSub,
                                            ),
                                          ),
                                        )),
                                  ],
                                );
                              }, modeType),
                            ],
                          ),
                          UI.dividerBlue,
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Font Size',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: appState.fontSize.drawerSub,
                                  ),
                                ),
                              ),
                              ObxValue<RxInt>((index) {
                                final isSelected = List.generate(3, (i) => i == index.value);

                                return ToggleButtons(
                                  onPressed: (int newIndex) {
                                    fontSize.value = newIndex;
                                    appController?.changeFontSize(newIndex);
                                  },
                                  isSelected: isSelected,
                                  color: Colors.black,
                                  selectedColor: Colors.white,
                                  selectedBorderColor: Color(0xFF4286CD),
                                  fillColor: Color(0xFF1CACE3),
                                  highlightColor: Colors.blue[200],
                                  borderWidth: 2,
                                  borderColor: Color(0xFF4286CD),
                                  borderRadius: BorderRadius.circular(50),
                                  children: [
                                    ..._toggleMap.entries.map((x) => Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Text(
                                            x.key,
                                            style: TextStyle(fontSize: x.value),
                                          ),
                                        )),
                                  ],
                                );
                              }, fontSize),
                            ],
                          ),
                        ],
                      )
                    : SizedBox();
              }, isSettings),
              UI.dividerBlue,
              Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: ListTile(
                  onTap: () async {
                    await Get.toNamed('/qna');
                  },
                  leading: Icon(
                    Icons.question_answer,
                    color: Colors.grey[850],
                  ),
                  title: Text(
                    'F A Q',
                    style: TextStyle(fontSize: appState.fontSize.drawerMain),
                  ),
                ),
              ),
              UI.dividerBlue,
              ListTile(),
            ],
          ),
        ),
      );
    });
  }
}
