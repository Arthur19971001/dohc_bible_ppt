import 'package:json_annotation/json_annotation.dart';

import '../classes/slide.dart';
import '../template/ppt/slides/slide3.xml.mustache.dart';

part 'calling.g.dart';

@JsonSerializable(createFactory: false)
class Calling extends Slide {
  final String title;
  final List<String> contents;
  Calling({
    this.title = '주를 높일지라',
    this.contents = const [
      '주를 높일지라',
      '여호와 하나님',
      '그 발등상 앞에서',
      '경배할 지어다',
      '거룩하신 하나님께'
    ],
    super.name = 'PowerPoint Presentation',
    super.slideNumber,
    super.speakerNotes,
    super.slideLayoutPath = 'slideLayout61',
  });

  @override
  int get id => 1558;

  @override
  int get layoutId => 3;

  @override
  int get rId => 9;

  @override
  String get source => template;

  @override
  Map<String, dynamic> toJson() => _$CallingToJson(this);
}
