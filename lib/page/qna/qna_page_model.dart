import '../../models/base_model.dart';
import '../../models/qna_model.dart';

class QnAPageModel extends BaseModel {
  QnAPageModel({
    required this.qna,
  });

  final QnAModel qna;

  static final QnAPageModel _empty = QnAPageModel(
    qna: QnAModel.empty(),
  );

  factory QnAPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  QnAPageModel copyWith({
    QnAModel? qna,
  }) {
    return QnAPageModel(qna: qna ?? this.qna);
  }

  @override
  List<Object?> get props => [qna];

  @override
  String toString() => 'qan: $qna';

}
