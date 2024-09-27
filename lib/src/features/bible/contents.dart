import 'domain/domain.dart';

String bibleContent(Verse gaeVersae, Verse nivVersae) {
  return '${gaeVersae.content}\n\n${nivVersae.content}';
}

String generatedFileName(
    String bibleName, List<Verse> gaeVerses) {
  return '$bibleName${gaeVerses.first.cnum}장${gaeVerses.first.vnum}절-${gaeVerses.last.cnum}장${gaeVerses.last.vnum}절.pptx';
}
