import 'base_model.dart';

enum ModeType {
  text,
  image,
  video,
}

class OnlyModeModel extends BaseModel {
  OnlyModeModel({
    required this.mode,
    required this.textMode,
    required this.imageMode,
    required this.videoMode,
  });

  final ModeType mode;
  final bool textMode;
  final bool imageMode;
  final bool videoMode;

  static final OnlyModeModel _empty = OnlyModeModel(
    mode: ModeType.video,
    textMode: false,
    imageMode: false,
    videoMode: false,
  );

  factory OnlyModeModel.empty() => _empty;

  factory OnlyModeModel.text() => _empty.copyWith(
        mode: ModeType.text,
        textMode: true,
        imageMode: false,
        videoMode: false,
      );

  factory OnlyModeModel.image() => _empty.copyWith(
        mode: ModeType.image,
        textMode: false,
        imageMode: true,
        videoMode: false,
      );

  factory OnlyModeModel.video() => _empty.copyWith(
        mode: ModeType.video,
        textMode: false,
        imageMode: false,
        videoMode: true,
      );

  static Iterable<OnlyModeModel> values() => [
        OnlyModeModel.text(),
        OnlyModeModel.image(),
        OnlyModeModel.video(),
      ];

  @override
  bool get isEmpty => this == _empty;

  OnlyModeModel copyWith({
    ModeType? mode,
    bool? textMode,
    bool? imageMode,
    bool? videoMode,
  }) {
    return OnlyModeModel(
      mode: mode ?? this.mode,
      textMode: textMode ?? this.textMode,
      imageMode: imageMode ?? this.imageMode,
      videoMode: videoMode ?? this.videoMode,
    );
  }

  @override
  List<Object?> get props => [mode, textMode, imageMode, videoMode];

  @override
  String toString() => 'mode: $mode textMode: $textMode imageMode: $imageMode videoMode: $videoMode';
}
