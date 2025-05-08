// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mustache_template/mustache_template.dart';

import '../template/ppt/slides/_rels/slide.xml.rels.mustache.dart';
import 'arc.dart';
import 'background.dart';
import 'base.dart';
import 'images.dart';
import 'speaker_notes.dart';
import 'text_value.dart';

part 'slide.g.dart';

Map<String, String Function(LambdaContext)> lambdaResolver(
  Arc arc, {
  Slide? slide,
}) {
  return {
    'new-id': (ctx) => (++arc.offset).toString(),
    'image-id': (ctx) {
      final src = ctx.renderString();
      final idx = int.parse(src);
      return arc.images[idx].order.toString();
    },
  };
}

Template? resolvePartials(String value) {
  if (value.isEmpty) return null;
  if (value == 'slide-background') return backgroundTemplate;
  if (value == 'speaker-notes') return slideNotesTemplate;
  if (value == 'text-value') return multiLineTemplate;
  if (value == 'text-line') return singleLineTemplate;
  return null;
}

@JsonSerializable(createFactory: false)
abstract class Slide extends Base {
  String name;
  bool slideNumber;
  TextValue? speakerNotes;
  int layoutId = -1;
  int notesId = -1;
  List<String> imagePath = [];
  String slideLayoutPath = '';
  var background = SlideBackground();

  // @override
  // int get id => super.id;

  // @override
  // int get rId => super.rId;

  @JsonKey(includeToJson: false)
  late Map<int, ImageReference?> imageRefs = {0: background.image};

  Slide({
    required this.name,
    this.speakerNotes,
    this.slideNumber = false,
    this.imagePath = const [],
    this.slideLayoutPath = '',
  });

  bool get hasNotes => speakerNotes != null;

  @JsonKey(includeToJson: false)
  String get source;

  Map<String, dynamic> generateLocalIds(Arc arc) {
    var localRId = 1;
    final localImages = arc.getImagesForSlide(this).toList();
    for (var item in localImages) {
      item.localRId = ++localRId;
    }
    final data = {
      'images': localImages.map((e) => e.toJson()).toList(),
      'comments': [],
      'layoutId': layoutId,
      'notesId': notesId,
      'imagePath': imagePath,
      'slideLayoutPath': slideLayoutPath,
    };
    for (final entry in imageRefs.entries) {
      final image = entry.value;
      final match = localImages.firstWhereOrNull((e) => e.path == image?.path);
      data['imageId${entry.key}'] = match?.localRId ?? 1;
    }
    return data;
  }

  String renderRelTemplate(Arc arc) {
    final source = Template(template);
    return source.renderString(toMap(arc));
  }

  String renderTemplate(Arc arc) {
    final template = Template(
      source,
      partialResolver: resolvePartials,
    );
    return template.renderString(toMap(arc));
  }

  Map<String, dynamic> replaceNulls(Map<String, dynamic> data) {
    final newMap = <String, dynamic>{};
    for (final entry in data.entries) {
      if (entry.value == null) {
        newMap[entry.key] = false;
      } else if (entry.value is Map<String, dynamic>) {
        newMap[entry.key] = replaceNulls(entry.value as Map<String, dynamic>);
      } else {
        newMap[entry.key] = entry.value;
      }
    }
    return newMap;
  }

  @override
  Map<String, dynamic> toJson() => _$SlideToJson(this);

  Map<String, dynamic> toMap(Arc arc) {
    final local = generateLocalIds(arc);
    final data = {
      ...toJson(),
      ...local,
      ...lambdaResolver(arc, slide: this),
    };
    // Replace null with false
    return replaceNulls(data);
  }
}
