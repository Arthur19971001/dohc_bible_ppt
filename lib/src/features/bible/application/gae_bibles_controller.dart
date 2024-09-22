import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/bible_repository.dart';
import '../domain/bible.dart';

part 'gae_bibles_controller.g.dart';

@riverpod
class GaeBiblesContorller extends _$GaeBiblesContorller {
  late final BibleRepository _bibleRepository;

  @override
  FutureOr<List<Bible>> build() async {
    _bibleRepository = ref.watch(bibleRepositoryProvider);
    final bibles = await _bibleRepository.getBibles();
    final gaeBibles = bibles.where((bible) => bible.vcode == 'GAE').toList();
    return gaeBibles;
  }

  Future<void> searchBiblesByName(String name) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bibles = await _bibleRepository.searchBiblesByName(name);

      final gaeBibles = bibles.where((bible) => bible.vcode == 'GAE').toList();

      return gaeBibles;
    });
  }
}
