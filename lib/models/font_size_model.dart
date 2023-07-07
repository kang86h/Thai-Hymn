import 'base_model.dart';

enum SizeType {
  small,
  medium,
  large,
}

class FontSizeModel extends BaseModel {
  FontSizeModel({
    required this.type,
    required this.appBarTitle,
    required this.title,
    required this.lyric,
    required this.drawerMain,
    required this.drawerSub,
    required this.cursor,
  });

  final SizeType type;
  final double appBarTitle;
  final double title;
  final double lyric;
  final double drawerMain;
  final double drawerSub;
  final double cursor;

  static final FontSizeModel _empty = FontSizeModel(
    type: SizeType.small,
    appBarTitle: 0,
    title: 0,
    lyric: 0,
    drawerMain: 0,
    drawerSub: 0,
    cursor: 0,
  );

  factory FontSizeModel.empty() => _empty;

  factory FontSizeModel.small() => _empty.copyWith(
        type: SizeType.small,
        appBarTitle: 36,
        title: 36,
        lyric: 30,
        drawerMain: 24,
        drawerSub: 20,
        cursor: 30,
      );

  factory FontSizeModel.medium() => _empty.copyWith(
        type: SizeType.medium,
        appBarTitle: 45,
        title: 48,
        lyric: 42,
        drawerMain: 28,
        drawerSub: 24,
        cursor: 42,
      );

  factory FontSizeModel.large() => _empty.copyWith(
        type: SizeType.large,
        appBarTitle: 54,
        title: 60,
        lyric: 54,
        drawerMain: 32,
        drawerSub: 28,
        cursor: 54,
      );

  static Iterable<FontSizeModel> values() => [
        FontSizeModel.small(),
        FontSizeModel.medium(),
        FontSizeModel.large(),
      ];

  @override
  bool get isEmpty => this == _empty;

  FontSizeModel copyWith({
    SizeType? type,
    double? appBarTitle,
    double? title,
    double? lyric,
    double? drawerMain,
    double? drawerSub,
    double? cursor,
  }) {
    return FontSizeModel(
      type: type ?? this.type,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      title: title ?? this.title,
      lyric: lyric ?? this.lyric,
      drawerMain: drawerMain ?? this.drawerMain,
      drawerSub: drawerSub ?? this.drawerSub,
      cursor: cursor ?? this.cursor,
    );
  }

  @override
  List<Object?> get props => [type, appBarTitle, title, lyric, drawerMain, drawerSub, cursor];

  @override
  String toString() =>
      'type: $type appBarTitle: $appBarTitle title: $title lyric: $lyric drawerMain: $drawerMain drawerSub: $drawerSub cursor: $cursor';
}
