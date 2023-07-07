import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_hymn/page/detail/detail_page.dart';
import 'package:thai_hymn/page/detail/detail_page_binding.dart';
import 'package:thai_hymn/page/qna/qna_page.dart';
import 'package:thai_hymn/page/qna/qna_page_binding.dart';
import '../page/main/main_page.dart';
import '../page/main/main_page_binding.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',

      getPages: [
        GetPage(
          name: '/',
          page: () => MainPage(),
          binding: MainPageBinding(),
        ),
        GetPage(
          name: '/detail',
          page: () => DetailPage(),
          binding: DetailPageBinding(),
        ),
        GetPage(
          name: '/qna',
          page: () => QnAPage(),
          binding: QnAPageBinding(),
        ),
      ],
    );
  }
}
