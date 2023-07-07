import 'package:thai_hymn/models/only_mode_model.dart';
import '../models/base_model.dart';
import '../models/font_size_model.dart';
import '../models/option_model.dart';

class AppModel extends BaseModel {
  AppModel({
    required this.fontSize,
    required this.modeType,
    required this.option,
  });

  final FontSizeModel fontSize;
  final OnlyModeModel modeType;
  final OptionModel option;

  static final AppModel _empty = AppModel(
    fontSize: FontSizeModel.empty(),
    modeType: OnlyModeModel.empty(),
    option: OptionModel.empty(),
  );

  factory AppModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  AppModel copyWith({
    FontSizeModel? fontSize,
    OnlyModeModel? modeType,
    OptionModel? option,
  }) {
    return AppModel(
      fontSize: fontSize ?? this.fontSize,
      modeType: modeType ?? this.modeType,
      option: option ?? this.option,
    );
  }

  @override
  List<Object?> get props => [fontSize, modeType, option];

  @override
  String toString() => 'fontSize: $fontSize modeType: $modeType option: $option';
}
