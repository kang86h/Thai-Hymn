import 'base_model.dart';

class OptionModel extends BaseModel {
  OptionModel({
    required this.autoplay,
    required this.looping,
    required this.alwaysShowAppBar,
  });

  final bool autoplay;
  final bool looping;
  final bool alwaysShowAppBar;

  @override
  bool get isEmpty => this == _empty;

  static final OptionModel _empty = OptionModel(
    autoplay: true,
    looping: true,
    alwaysShowAppBar: false,
  );

  factory OptionModel.empty() => _empty;

  OptionModel copyWith({
    bool? autoplay,
    bool? looping,
    bool? alwaysShowAppBar,
  }) {
    return OptionModel(
      autoplay: autoplay ?? this.autoplay,
      looping: looping ?? this.looping,
      alwaysShowAppBar: alwaysShowAppBar ?? this.alwaysShowAppBar,
    );
  }

  @override
  List<Object?> get props => [autoplay, looping, alwaysShowAppBar];

  @override
  String toString() => 'autoplay: $autoplay looping: $looping alwaysShowAppBar: $alwaysShowAppBar';
}
