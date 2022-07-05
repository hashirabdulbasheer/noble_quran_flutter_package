import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:noble_quran/enums/translations.dart';
import 'package:noble_quran/models/surah.dart';
import 'package:noble_quran/models/surah_title.dart';
import 'package:noble_quran/models/word.dart';
import 'package:noble_quran/noble_quran.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// test the surah list api
  test('get surah list', () async {
    List<NQSurahTitle> surahs = await NobleQuran.getSurahList();
    expect(surahs.length, 114);
  });

  /// test the surah list content
  test('get surah list content', () async {
    List<NQSurahTitle> surahs = await NobleQuran.getSurahList();
    for (NQSurahTitle surah in surahs) {
      expect(surah.name.isNotEmpty, true);
      expect(surah.translationEn.isNotEmpty, true);
      expect(surah.transliterationEn.isNotEmpty, true);
      expect(surah.number > 0, true);
      expect(surah.totalVerses > 0, true);
    }
  });

  /// test the surah at index
  test('get surah at index', () async {
    NQSurahTitle surah = await NobleQuran.getSurahTitleAtIndex(Random().nextInt(114));
    expect(surah.name.isNotEmpty, true);
    expect(surah.translationEn.isNotEmpty, true);
    expect(surah.transliterationEn.isNotEmpty, true);
    expect(surah.number > 0, true);
    expect(surah.totalVerses > 0, true);
  });

  /// test the surah word by word
  test('get surah word by word', () async {
    List<List<NQWord>> words = await NobleQuran.getSurahWordByWord(Random().nextInt(114));
    expect(words.length > 0, true);
    expect(words[0].length > 0, true);
    expect(words[0][0].aya >= 0, true);
    expect(words[0][0].ar.isNotEmpty, true);
    expect(words[0][0].aya >= 0, true);
    expect(words[0][0].sura >= 0, true);
    expect(words[0][0].word >= 0, true);
    expect(words[0][0].tr.isNotEmpty, true);
  });

  /// test the surah arabic
  test('get surah arabic', () async {
    NQSurah surah = await NobleQuran.getSurahArabic(Random().nextInt(114));
    expect(surah.aya.length > 0, true);
    expect(surah.aya[0].index.isNotEmpty, true);
    expect(surah.aya[0].text.isNotEmpty, true);
    expect(surah.name != null && surah.name!.isNotEmpty, true);
    expect(surah.index.isNotEmpty, true);
  });

  /// test the surah transliteration
  test('get surah transliteration', () async {
    NQSurah surah = await NobleQuran.getSurahTransliteration(Random().nextInt(114));
    expect(surah.aya.length > 0, true);
    expect(surah.aya[0].index.isNotEmpty, true);
    expect(surah.aya[0].text.isNotEmpty, true);
    expect(surah.name != null && surah.name!.isNotEmpty, true);
    expect(surah.index.isNotEmpty, true);
  });

  /// test the surah translation
  test('get surah translation', () async {
    NQSurah surah =
        await NobleQuran.getTranslationString(Random().nextInt(114), NQTranslation.SAHIH);
    expect(surah.aya.length > 0, true);
    expect(surah.aya[0].index.isNotEmpty, true);
    expect(surah.aya[0].text.isNotEmpty, true);
    expect(surah.name != null && surah.name!.isNotEmpty, true);
    expect(surah.index.isNotEmpty, true);
  });
}
