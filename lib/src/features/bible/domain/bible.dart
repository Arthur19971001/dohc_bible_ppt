import 'dart:convert';

class Bible {
  String vcode;
  int bcode;
  String type;
  String name;
  int chapterCount;
  String shortName;

  Bible({
    required this.vcode,
    required this.bcode,
    required this.type,
    required this.name,
    required this.chapterCount,
    required this.shortName,
  });

  factory Bible.fromJson(String source) =>
      Bible.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Bible.fromMap(Map<String, dynamic> map) {
    return Bible(
      vcode: map['vcode'] as String,
      bcode: map['bcode'] as int,
      type: map['type'] as String,
      name: map['name'] as String,
      chapterCount: map['chapter_count'] as int,
      shortName: map['short_name'] as String,
    );
  }

  factory Bible.initial() {
    return Bible(
      vcode: '',
      bcode: 0,
      type: '',
      name: '',
      chapterCount: 0,
      shortName: '',
    );
  }

  String getTypeLabel() {
    return type == 'old' ? '구약' : '신약';
  }
}
