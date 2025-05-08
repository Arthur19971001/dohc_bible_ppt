import 'package:json_annotation/json_annotation.dart';

import '../classes/slide.dart';
import '../template/ppt/slides/slide2.xml.mustache.dart';

part 'barcode.g.dart';

@JsonSerializable(createFactory: false)
class SlideBarcode extends Slide {
  SlideBarcode({
    super.name = 'PowerPoint Presentation',
    super.slideNumber,
    super.speakerNotes,
    super.imagePath = const ['image58.jpg'],
    super.slideLayoutPath = 'slideLayout91',
  });

  @override
  int get id => 4983;

  @override
  int get layoutId => 2;

  @override
  int get rId => 8;

  @override
  String get source => template;

  @override
  Map<String, dynamic> toJson() => _$SlideBarcodeToJson(this);
}
