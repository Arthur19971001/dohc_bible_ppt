import 'domain/domain.dart';

String bibleContent(
    Bible? gaeBible, Bible? nivBible, Verse? gaeVerse, Verse? nivVerse,
    [bool hasVersName = true]) {
  return '${gaeVerse == null ? '' : '${hasVersName ? '(${gaeBible?.shortName} ${gaeVerse.cnum}-${gaeVerse.vnum})' : ''} ${gaeVerse.content}\n\n'} ${nivVerse == null ? '' : '${hasVersName ? '(${nivBible?.shortName} ${nivVerse.cnum}-${nivVerse.vnum})' : ''} ${nivVerse.content}'}';
}

String generatedFileName(String bibleName, List<Verse> gaeVerses) {
  return '$bibleName${gaeVerses.first.cnum}장${gaeVerses.first.vnum}절-${gaeVerses.last.cnum}장${gaeVerses.last.vnum}절.pptx';
}
