import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetViewHelper<T> extends StatelessWidget {
  const GetViewHelper({Key? key}) : super(key: key);

  T? get controller => Get.isRegistered<T>() ? Get.find<T>() : null;

  @override
  Widget build(BuildContext context);
}
