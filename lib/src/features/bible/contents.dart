import 'domain/domain.dart';

String bibleContent(
    Bible gaeBible, Bible nivBible, Verse gaeVersae, Verse nivVersae) {
  return '(${gaeBible.shortName} ${gaeVersae.cnum}-${gaeVersae.vnum}) ${gaeVersae.content}\n\n(${nivBible.shortName} ${nivVersae.cnum}-${nivVersae.vnum}) ${nivVersae.content}';
}

String generatedFileName(String bibleName, List<Verse> gaeVerses) {
  return '$bibleName${gaeVerses.first.cnum}장${gaeVerses.first.vnum}절-${gaeVerses.last.cnum}장${gaeVerses.last.vnum}절.pptx';
}
