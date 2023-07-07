import 'base_model.dart';

class QnAModel extends BaseModel {
  QnAModel({
    required this.text,
  });

  final Iterable<Iterable<String>> text;

  static final QnAModel _empty = QnAModel(
    text: const [],
  );

  factory QnAModel.empty() => _empty;

  factory QnAModel.text() => QnAModel(
        text: [
          [
            'Q.',
            'The app-bar disappears from the wide(horizontal) screen.',
            'A.',
            '1)Turn to the narrow(vertical) screen and move to the home.',
            '2)turn on "Always Show AppBar" in the Setting, it will be maintained.'
          ],
          ['Q.', 'I want to turn off the automatic playback function.', 'A.', 'You can turn off AutoPlay in "Setting".'],
          [
            'Q.',
            'There is a typo in the lyrics. Where should I ask?',
            'A.',
            'Please fill out the form below and send it to',
            'kang86h@gmail.com.',
            'Ex)Chapter 1 Verse 1',
            'Lyrics before editing : Celebrons',
            'Lyrics after editing : Célébrons'
          ],
          ['Q.', 'Where should I contact for suggestions?', 'A.', 'Please contact kang86h@gmail.com.'],
        ],
      );

  static QnAModel values() => QnAModel.text();

  @override
  bool get isEmpty => this == _empty;

  String get qnatext => text.toList().asMap().entries.map((x) => '${x.value.join('\n')}').join('\n\n');

  QnAModel copyWith({
    Iterable<Iterable<String>>? text,
  }) {
    return new QnAModel(
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [text];

  @override
  String toString() => 'text: $text';
}
