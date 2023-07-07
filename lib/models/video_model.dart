import 'base_model.dart';

class VideoModel extends BaseModel {
  VideoModel({
    required this.name,
    required this.title,
    required this.lyric,
    required this.maxPage,
  });

  final String name;

  final String title;

  final Iterable<Iterable<String>> lyric;

  final int maxPage;

  static final VideoModel _empty = VideoModel(
    name: '',
    title: '',
    lyric: const [],
    maxPage: 0,
  );

  factory VideoModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  String get lyricString => lyric
      .toList()
      .asMap()
      .entries
      .map((x) => '${x.key + 1}. ${x.value.join('\n')}')
      .join('\n\n');

  @override
  List<Object?> get props => [name, title, lyric, maxPage];

  @override
  String toString() =>
      'assets: $name title: $title lyric: $lyric maxPage: $maxPage';

  VideoModel copyWith({
    String? assets,
    String? title,
    Iterable<Iterable<String>>? lyric,
    int? maxLine,
  }) {
    return new VideoModel(
      name: assets ?? this.name,
      title: title ?? this.title,
      lyric: lyric ?? this.lyric,
      maxPage: this.maxPage,
    );
  }

  static Iterable<VideoModel> values() => [
        VideoModel.H27(),
        VideoModel.H499(),
      ];

  factory VideoModel.H27() => VideoModel(
        name: 'T27',
        title: '27. พระพักตร์พระเจ้าผุดผ่องเเวววาม',
        lyric: [
          [
            //verse 1
            'พระพักตร์พระเจ้าผุดผ่องเเวววามดูงามเลิศ',
            'ต้องนัยน์ตาพระเศียรทรงสวมมงกุฎโสภาพระ',
            'โอษฐ์ตรัสคํารุณย์พระโอษฐ์ตรัสคําการุณย์',
          ],
          [
            //verse 2
            'ทั่วโลกแหล่งหล้าหาเปรียบฤๅมีมนุษย์เม',
            'ธีไม่ปานทั่วฟ้าสวรรค์และจักรวาลภู',
            'บาลทรงศักดิ์ยิ่งใหญ่ภูบาลทรงศักดิ์ยิ่งใหญ่',
          ],
          [
            //verse 3
            'ตัวข้าเป็นหนี้พระองค์มากมายชีวิตจิต',
            'ใจและกายความตายพระองค์ทรงให้มีชัยรอด',
            'จากหลุมมรณารอดจากหลุมมรณา',
          ],
          [
            //verse 4
            'ข้าวางใจว่าพระองค์ทรงนําให้ข้าถึง',
            'แดนแมนสรวงยามข้าเข้าเฝ้าแนบชิดพระทรวงดวง',
            'จิตของข้าเบิกบานดวงจิตของข้าเบิกบาน',
            '',
          ],
        ],
        maxPage: 7,
      );

  factory VideoModel.H499() => VideoModel(
        name: 'T499',
        title: '499. ข้าเดินอยู่ในสวน',
        lyric: [
          [
            //verse 1
            'ข้าเดินอยู่ในสวนเพียงลำพัง',
            'น้ำค้างยังหยดค้างบนดอกไม้งาม',
            'ข้าได้ยินเสียงตรัสพระดำรัสพระองค์',
            'พระบุตรพระเจ้าสำแดงแก่ข้า',
            'ทรงดำเนินกับข้าและทรงตรัสกับข้า',
            'ทรงตรัสว่าข้าเป็นของพระองค์',
            'ความสุขใจที่มีเมื่ออยู่เคียงพระองค์',
            'ใครจะรู้ไม่มีใครเลย',
          ],
          [
            //verse 2
            'พระองค์ตรัสด้วยสำเนียงอ่อนหวาน',
            'ไพเราะปานเหล่านกพากันร้องเพลง',
            'ท่วงทำนองบรรเลงประทานเพลงแก่ข้า',
            'มีเสียงบรรเลงขึ้นในใจข้า',
            'ทรงดำเนินกับข้าและทรงตรัสกับข้า',
            'ทรงตรัสว่าข้าเป็นของพระองค์',
            'ความสุขใจที่มีเมื่ออยู่เคียงพระองค์',
            'ใครจะรู้ไม่มีใครเลย',
          ],
          [
            //verse 3
            'ข้าได้อยู่ในสวนกับพระองค์',
            'แม้ค่ำคืนมืดมิดจะโอบล้อมอยู่',
            'แต่ทรงชูใจข้าด้วยพระทัยเมตตา',
            'พระสุระเสียงทรงเรียกตัวข้า',
            'ทรงดำเนินกับข้าและทรงตรัสกับข้า',
            'ทรงตรัสว่าข้าเป็นของพระองค์',
            'ความสุขใจที่มีเมื่ออยู่เคียงพระองค์',
            'ใครจะรู้ไม่มีใครเลย',
            '',
          ],
        ],
        maxPage: 7,
      );
}
