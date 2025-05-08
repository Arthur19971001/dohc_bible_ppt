import 'package:json_annotation/json_annotation.dart';

import '../classes/slide.dart';
import '../template/ppt/slides/slide4.xml.mustache.dart';

part 'blank.g.dart';

@JsonSerializable(createFactory: false)
class SlideBlank extends Slide {
  SlideBlank({
    super.name = 'PowerPoint Presentation',
    super.slideNumber,
    super.speakerNotes,
    super.slideLayoutPath = 'slideLayout2',
  });

  @override
  int get id => 1365;

  @override
  int get layoutId => 4;

  @override
  int get rId => 10;

  @override
  String get source => template;

  @override
  Map<String, dynamic> toJson() => _$SlideBlankToJson(this);
}
