import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable {
  bool get isEmpty;

  BaseModel copyWith();
}
