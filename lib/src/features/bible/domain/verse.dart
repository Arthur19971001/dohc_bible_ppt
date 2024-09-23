import 'dart:convert';

class Verse {
  String vcode;
  int bcode;
  int cnum;
  int vnum;
  String content;
  Verse({
    required this.vcode,
    required this.bcode,
    required this.cnum,
    required this.vnum,
    required this.content,
  });

  factory Verse.fromJson(String source) =>
      Verse.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Verse.fromMap(Map<String, dynamic> map) {
    return Verse(
      vcode: map['vcode'] as String,
      bcode: map['bcode'] as int,
      cnum: map['cnum'] as int,
      vnum: map['vnum'] as int,
      content: map['content'] as String,
    );
  }

  Verse copyWith({
    String? vcode,
    int? bcode,
    int? cnum,
    int? vnum,
    String? content,
  }) {
    return Verse(
      vcode: vcode ?? this.vcode,
      bcode: bcode ?? this.bcode,
      cnum: cnum ?? this.cnum,
      vnum: vnum ?? this.vnum,
      content: content ?? this.content,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vcode': vcode,
      'bcode': bcode,
      'cnum': cnum,
      'vnum': vnum,
      'content': content,
    };
  }
}
