import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:thai_hymn/models/base_model.dart';

abstract class GetControllerHelper<T extends BaseModel> extends Value<T> with GetLifeCycleBase {
  GetControllerHelper(T initial) : super(initial) {
    $configureLifeCycle();
  }

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    SchedulerBinding.instance?.addPostFrameCallback((_) => onReady());
  }

  void onTryAgain() {
    change(state, status: RxStatus.success());
  }

  @override
  T get state => super.state!;

  Future<bool> get isWillPop async => true;

  Future<bool> onWillPop() => isWillPop;
}
