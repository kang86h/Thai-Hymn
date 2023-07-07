import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:thai_hymn/pref_helper.dart';
import 'app/app.dart';
import 'app/app_controller.dart';
import 'app/app_model.dart';
import 'models/font_size_model.dart';
import 'models/only_mode_model.dart';
import 'models/option_model.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Color(0x8A1CACE3),
    ),
  );

  await Get.putAsync<AppController>(() async => AppController(
        model: AppModel.empty().copyWith(
          fontSize: FontSizeModel.values().elementAt(await PrefHelper.getPrefInt(PrefType.fontSize) ?? 0),
          modeType: OnlyModeModel.values().elementAt(await PrefHelper.getPrefInt(PrefType.onlyMode) ?? 2),
          option: OptionModel.empty().copyWith(
            autoplay: await PrefHelper.getPrefBool(PrefType.autoplay) ?? true,
            looping: await PrefHelper.getPrefBool(PrefType.looping) ?? true,
            alwaysShowAppBar: await PrefHelper.getPrefBool(PrefType.alwaysShowAppBar) ?? false,
          ),
        ),
      ));


  runApp(App());
}

// flutter build web --web-renderer canvaskit --release   (웹으로 빌드할때 IOS에서 동작하게 하려면 캔버스키트로 빌드해야함)
// flutter build web --web-renderer html --release (캔버스킷으로 빌드하면 널펑션 에러 발생... html로 렌더링해야함...)
// firebase deploy --only hosting
// flutter run -d chrome --web-renderer html (html로 디버깅 모드)
// 네팔어 유니코드 가사 확인 필요

/*
<!-- Apple WebGL 2.0 fix (https://github.com/flutter/flutter/issues/89655#issuecomment-919685843) -->
  <!-- TODO: Remove when https://github.com/flutter/engine/pull/29038 is merged to stable -->
  <script src="https://unpkg.com/platform@1.3.5/platform.js"></script>
  <script type="text/javascript">
    let isSafari = /^((?!chrome|android).)*safari/i.test(platform.ua);
    if (isSafari) {
      HTMLCanvasElement.prototype.getContext = function (orig) {
        return function (type) {
          return type !== "webgl2" ? orig.apply(this, arguments) : null
        }
      }(HTMLCanvasElement.prototype.getContext)
    }
  </script>
 */
// IOS 15에서 동작시키기 위해 Index.html 에서 head 밑에 넣어줘야함.

/*
<key>NSAppTransportSecurity</key>
	<dict>
	<key>NSAllowsArbitraryLoads</key>
	<true/>
	</dict>
	ios/Runner/Info.plist 의 마지막 /dict 위에 붙여넣어줘야함
 */

/*
flutter clean && flutter pub get && flutter pub run flutter_native_splash:create
앱 열릴때까지 now loading 화면 넣기위해 터미널에 입력해줘야 함
 */


//1. play asset delivery 적용, 2.web build시 video 모드에서 다른모드로 넘어갈때 재생 끊김 현상 수정.

/*
rename 사용방법
설치: dart pub global activate rename
사용: dart pub global run rename --bundleId com.계정 or 회사.앱 이름
ex)dart pub global run rename --bundleId com.welc.french_hymn

    dart pub global run rename --appname "사용할 앱 이름"
 */

//폰트중에서 히말라야로 바꿔야 할 것 추려서 바꾸기