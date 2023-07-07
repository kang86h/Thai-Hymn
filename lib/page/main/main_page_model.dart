import '../../models/base_model.dart';
import '../../models/video_model.dart';

class MainPageModel extends BaseModel {
  MainPageModel({
    required this.orders,
    required this.orderIndex,
    required this.items,
    required this.itemIndex,
    required this.videos,
  });

  final Iterable<String> orders;
  final int orderIndex;

  final Iterable<String> items;
  final int itemIndex;

  final Iterable<VideoModel> videos;

  static final MainPageModel _empty = MainPageModel(
    orders: const [],
    orderIndex: 0,
    items: const [],
    itemIndex: 0,
    videos: const [],
  );

  factory MainPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  String get order => orders.elementAt(orderIndex);

  String get item => items.elementAt(itemIndex);

  @override
  MainPageModel copyWith({
    Iterable<String>? orders,
    int? orderIndex,
    Iterable<String>? items,
    int? itemIndex,
    Iterable<VideoModel>? videos,
  }) {
    return MainPageModel(
      orders: orders ?? this.orders,
      orderIndex: orderIndex ?? this.orderIndex,
      items: items ?? this.items,
      itemIndex: itemIndex ?? this.itemIndex,
      videos: videos ?? this.videos,
    );
  }

  @override
  List<Object?> get props => [orders, orderIndex, items, itemIndex, videos];

  @override
  String toString() => 'orders: $orders orderIndex: $orderIndex items: $items itemIndex: $itemIndex videos: $videos';
}
