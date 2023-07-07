import '../../models/base_model.dart';
import '../../models/video_model.dart';

class DetailPageModel extends BaseModel {
  DetailPageModel({
    required this.video,
  });

  final VideoModel video;

  static final DetailPageModel _empty = DetailPageModel(
    video: VideoModel.empty(),
  );

  factory DetailPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  DetailPageModel copyWith({
    VideoModel? video,
  }) {
    return DetailPageModel(
      video: video ?? this.video,
    );
  }

  @override
  List<Object?> get props => [video];

  @override
  String toString() => 'video: $video';
}
