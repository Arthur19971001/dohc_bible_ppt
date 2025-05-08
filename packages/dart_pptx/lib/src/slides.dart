import 'package:dart_pptx/src/slides/barcode.dart';
import 'package:dart_pptx/src/slides/blank.dart';
import 'package:dart_pptx/src/slides/calling.dart';

import 'classes.dart';
import 'powerpoint.dart';
import 'slides/intro.dart';

extension SlideTemplates on PowerPoint {
  Slide addBarcodeSlide({
    TextValue? title,
  }) =>
      addSlide(SlideBarcode());

  Slide addBlankSlide() => addSlide(SlideBlank());

  Slide addCallingSlide({
    String? title,
    List<String>? contents,
  }) =>
      addSlide(Calling(
        title: title ?? '주를 높일지라',
        contents: contents ??
            const ['주를 높일지라', '여호와 하나님', '그 발등상 앞에서', '경배할 지어다', '거룩하신 하나님께'],
      ));

  Slide addIntroSlide({
    TextValue? title,
  }) =>
      addSlide(SlideIntro());
}
