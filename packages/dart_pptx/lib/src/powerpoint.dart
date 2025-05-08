import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_pptx/dart_pptx.dart';

import 'classes.dart';
import 'classes/arc.dart';
import 'template/template.dart';

class PowerPoint {
  var context = PresentationContext();
  var layout = Layout(
    type: 'custom',
    width: 24384000,
    height: 13716000,
  );
  var slides = <Slide>[];

  String? company;
  String? title;

  String? subject;
  String? author;
  String? revision;

  Slide addSlide(
    Slide slide, {
    TextValue? notes,
    bool? showSlideNumbers,
  }) {
    slide.speakerNotes = notes ?? slide.speakerNotes;
    slides.add(slide);
    return slide;
  }

  Future<Uint8List?> save() async {
    final arc = Arc();

    // Copy template to temp path
    for (final entry in templates.entries) {
      // final utf16 = Uint16List.fromList(entry.value);
      final name = entry.key;
      if (name.startsWith('.') ||
          name.endsWith('.mustache') ||
          name.endsWith('.keep')) {
        continue;
      }
      if (name.contains('.png') || name.contains('.jpg')) {
        // Base64 decode
        final bytes = base64Decode(entry.value);
        context.archive.addBinaryFile(name, bytes);
        continue;
      }
      String path = name;
      if (name.contains('/_.')) {
        // Convert back to hidden files
        path = name.replaceAll('/_.', '/.');
      }
      final result = entry.value.trim();
      context.archive.addFile(path, result);
    }

    final files = <String, String>{};

    arc.init(slides);

    for (var i = 0; i < slides.length; i++) {
      final item = slides[i];
      files['ppt/slides/_rels/slide${item.order}.xml.rels'] =
          item.renderRelTemplate(arc);
      files['ppt/slides/slide${item.order}.xml'] = item.renderTemplate(arc);
    }

    for (var i = 1; i < 144; i++) {
      files['ppt/slideLayouts/_rels/slideLayout$i.xml.rels'] =
          templates['ppt/slideLayouts/_rels/slideLayout$i.xml.rels.mustache']!;
      files['ppt/slideLayouts/slideLayout$i.xml'] =
          templates['ppt/slideLayouts/slideLayout$i.xml.mustache']!;
    }

    for (var i = 1; i < 9; i++) {
      files['ppt/theme/theme$i.xml'] =
          templates['ppt/theme/theme$i.xml.mustache']!;
    }

    for (var i = 1; i < 7; i++) {
      files['ppt/slideMasters/_rels/slideMaster$i.xml.rels'] =
          templates['ppt/slideMasters/_rels/slideMaster$i.xml.rels.mustache']!;

      files['ppt/slideMasters/slideMaster$i.xml'] =
          templates['ppt/slideMasters/slideMaster$i.xml.mustache']!;
    }

    // for (var i = 1; i < 4; i++) {
    //   files['ppt/notesSlides/_rels/notesSlide$i.xml.rels'] =
    //       templates['ppt/notesSlides/_rels/notesSlide$i.xml.rels.mustache']!;

    //   files['ppt/notesSlides/notesSlide$i.xml'] =
    //       templates['ppt/notesSlides/notesSlide$i.xml.mustache']!;
    // }

    final pres = Presentation(
      slides: slides,
    );

    files.addAll({
      'docProps/app.xml': App(
        slides: slides,
      ).toString(),
      'docProps/core.xml': Core(
        author: 'Arhtur Kim',
        revision: '1099',
      ).toString(), //templates['docProps/core.xml.mustache']!,
      'ppt/presentation.xml': pres.toString(),
      'ppt/_rels/presentation.xml.rels': pres.createRel(),
      'ppt/handoutMasters/_rels/handoutMaster1.xml.rels': templates[
          'ppt/handoutMasters/_rels/handoutMaster1.xml.rels.mustache']!,
      'ppt/handoutMasters/handoutMaster1.xml':
          templates['ppt/handoutMasters/handoutMaster1.xml.mustache']!,
      'ppt/notesMasters/_rels/notesMaster1.xml.rels':
          templates['ppt/notesMasters/_rels/notesMaster1.xml.rels.mustache']!,
      'ppt/notesMasters/notesMaster1.xml':
          templates['ppt/notesMasters/notesMaster1.xml.mustache']!,
      '[Content_Types].xml': ContentType(
        slides: slides,
      ).toString(),
      'presProps.xml': templates['ppt/presProps.xml.mustache']!,
      'tableStyles.xml': templates['ppt/tableStyles.xml.mustache']!,
      'viewProps.xml': templates['ppt/viewProps.xml.mustache']!,
    });

    // Copy assets
    final futures = <Future>[];
    for (final item in arc.images) {
      futures.add(Future.sync(() async {
        final bytes = await context.assets.getImageData(item);
        if (bytes != null) {
          final imgName = 'image${item.order}.${item.ext}';
          // final fileName = imgName ?? path.basename(item.path);
          context.archive.addBinaryFile('ppt/media/$imgName', bytes);
        }
      }));
    }
    await Future.wait(futures);

    for (final entry in files.entries) {
      final str = entry.value.toString();
      context.archive.addFile(entry.key, str);
    }
    // return null;

    // Create .pptx file
    final data = context.archive.toBytes();
    if (data == null) return null;
    return Uint8List.fromList(data);
  }

  void setLayout(Layout layout) {
    this.layout = layout;
  }
}
