import 'package:json_annotation/json_annotation.dart';

import '../classes/slide.dart';
import '../template/ppt/slides/slide1.xml.mustache.dart';

part 'intro.g.dart';

@JsonSerializable(createFactory: false)
class SlideIntro extends Slide {
  SlideIntro({
    super.name = 'PowerPoint Presentation',
    super.slideNumber,
    super.speakerNotes,
    super.imagePath = const ['image57.jpg'],
    super.slideLayoutPath = 'slideLayout91',
  });

  @override
  int get id => 1331;

  @override
  int get layoutId => 1;

  @override
  int get rId => 7;

  @override
  String get source => template;

  @override
  Map<String, dynamic> toJson() => _$SlideIntroToJson(this);
}
