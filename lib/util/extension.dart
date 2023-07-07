import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ValueNullableEx<T> on Value<T>? {
  Widget rx(
    NotifierBuilder<T> widget, {
    Widget Function(String? error)? onError,
    Widget? onLoading,
    Widget? onEmpty,
  }) {
    return this?.rx(widget, onError: onError, onLoading: onLoading, onEmpty: onEmpty) ?? const SizedBox();
  }
}

extension ValueEx<T> on Value<T> {
  Widget rx(
    NotifierBuilder<T> widget, {
    Widget Function(String? error)? onError,
    Widget? onLoading,
    Widget? onEmpty,
  }) {
    return SimpleBuilder(builder: (_) {
      if (status.isLoading) {
        return onLoading ?? const SizedBox();
      } else if (status.isError) {
        return onError != null ? onError(status.errorMessage) : const SizedBox();
      } else if (status.isEmpty) {
        return onEmpty ?? const SizedBox();
      }
      return widget(value!);
    });
  }
}
