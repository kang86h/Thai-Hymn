import 'package:thai_hymn/models/font_size_model.dart';
import 'package:thai_hymn/models/only_mode_model.dart';
import 'package:thai_hymn/pref_helper.dart';

import '../../util/util.dart';
import 'app_model.dart';

class AppController extends GetControllerHelper<AppModel> {
  AppController({
    required AppModel model,
  }) : super(model);

  @override
  void onInit() async {
    super.onInit();
  }

  void changePrefType(PrefType prefType, bool value) async {
    change(state.copyWith(
      option: state.option.copyWith(
        autoplay: prefType == PrefType.autoplay ? value : null,
        looping: prefType == PrefType.looping ? value : null,
        alwaysShowAppBar: prefType == PrefType.alwaysShowAppBar ? value : null,
      ),
    ));

    await PrefHelper.setPrefBool(prefType, value);
  }

  void changeFontSize(int index) async {
    final fontSize = FontSizeModel.values().elementAt(index);

    change(state.copyWith(
      fontSize: fontSize,
    ));

    await PrefHelper.setPrefInt(PrefType.fontSize, index);
  }

  void changeModeType(int index) async {
    final onlyMode = OnlyModeModel.values().elementAt(index);

    change(state.copyWith(
      modeType: onlyMode,
    ));

    await PrefHelper.setPrefInt(PrefType.onlyMode, index);
  }
}
