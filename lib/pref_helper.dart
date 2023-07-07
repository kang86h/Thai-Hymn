import 'package:shared_preferences/shared_preferences.dart';

enum PrefType {
  autoplay,
  looping,
  alwaysShowAppBar,
  fontSize,
  onlyMode,
}

extension PrefTypeEx on PrefType {
  String get text =>
      {
        PrefType.autoplay: 'AutoPlay',
        PrefType.looping: 'Looping',
        PrefType.alwaysShowAppBar: 'Always Show AppBar',
      }[this] ??
      '';
}

class PrefHelper {
  static final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  static Future<bool> clear() async {
    return (await _pref).clear();
  }

  static Future<void> reload() async {
    return (await _pref).reload();
  }

  static Future<String?> getPrefString(PrefType type) async {
    return (await _pref).getString(type.toString());
  }

  static Future<bool> setPrefString(PrefType type, String value) async {
    return (await _pref).setString(type.toString(), value);
  }

  static Future<int?> getPrefInt(PrefType type) async {
    return (await _pref).getInt(type.toString());
  }

  static Future<bool> setPrefInt(PrefType type, int value) async {
    return (await _pref).setInt(type.toString(), value);
  }

  static Future<bool?> getPrefBool(PrefType type) async {
    return (await _pref).getBool(type.toString());
  }

  static Future<bool> setPrefBool(PrefType type, bool value) async {
    return (await _pref).setBool(type.toString(), value);
  }

  static Future<bool> removePref(PrefType type) async {
    return (await _pref).remove(type.toString());
  }

  static Future<List<bool>> removePrefList(List<PrefType> typeList) async {
    return Future.wait(typeList.map((x) async => (await _pref).remove(x.toString())));
  }
}
