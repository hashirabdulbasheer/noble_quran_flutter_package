import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
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
    NQSurahTitle surah =
        await NobleQuran.getSurahTitleAtIndex(Random().nextInt(114));
    expect(surah.name.isNotEmpty, true);
    expect(surah.translationEn.isNotEmpty, true);
    expect(surah.transliterationEn.isNotEmpty, true);
    expect(surah.number > 0, true);
    expect(surah.totalVerses > 0, true);
  });

  /// test the surah word by word
  test('get surah word by word', () async {
    List<List<NQWord>> words =
        await NobleQuran.getSurahWordByWord(Random().nextInt(114));
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
    NQSurah surah =
        await NobleQuran.getSurahTransliteration(Random().nextInt(114));
    expect(surah.aya.length > 0, true);
    expect(surah.aya[0].index.isNotEmpty, true);
    expect(surah.aya[0].text.isNotEmpty, true);
    expect(surah.name != null && surah.name!.isNotEmpty, true);
    expect(surah.index.isNotEmpty, true);
  });

  /// test the surah translation
  test('get surah translation', () async {
    NQSurah surah = await NobleQuran.getTranslationString(
        Random().nextInt(114), NQTranslation.sahih);
    expect(surah.aya.length > 0, true);
    expect(surah.aya[0].index.isNotEmpty, true);
    expect(surah.aya[0].text.isNotEmpty, true);
    expect(surah.name != null && surah.name!.isNotEmpty, true);
    expect(surah.index.isNotEmpty, true);
  });

  test('get surah recitations', () {
    List<QuranReciter> reciters = NobleQuran.getAllReciters();
    expect(reciters.isNotEmpty, true);
    expect(reciters.length, 58);
  });

  test('get surah url', () async {
    QuranReciter reciter = QuranReciter(
        subfolder: "khalefa_al_tunaiji_64kbps",
        name: "Khalefa Al-Tunaiji",
        bitrate: "64kbps");
    String url = NobleQuran.audioRecitationUrl(reciter, 1, 2);
    expect(url,
        "http://www.everyayah.com/data/khalefa_al_tunaiji_64kbps/001002.mp3");
  });

  test('translations', () async {
    NQTranslation sahih =
        NobleQuran.getTranslationFromTitle(NQTranslation.sahih.title);
    List<NQTranslation> translations = NobleQuran.getAllTranslations();
    for (NQTranslation t in translations) {
      for (var i = 0; i < 114; i++) {
        NQSurah surah = await NobleQuran.getTranslationString(i, t);
        NQSurah sahihSurah = await NobleQuran.getTranslationString(i, sahih);
        expect(surah.aya.length, sahihSurah.aya.length);
      }
    }
  });

  test('getRukuForAya', () async {
    NQRuku? ruku = NobleQuran.getRukuForAya(0, 3);
    expect(ruku, kLocalRukusData[0]);
    ruku = NobleQuran.getRukuForAya(1, 120);
    expect(ruku, kLocalRukusData[14]);
    ruku = NobleQuran.getRukuForAya(0, 120);
    expect(ruku, null);
    ruku = NobleQuran.getRukuForAya(0, 0);
    expect(ruku, kLocalRukusData[0]);
    ruku = NobleQuran.getRukuForAya(113, 5);
    expect(ruku, kLocalRukusData[555]);
  });

  test('getRuku', () async {
    NQRuku? ruku = NobleQuran.getRuku(0);
    expect(ruku, kLocalRukusData[0]);
    ruku = NobleQuran.getRuku(555);
    expect(ruku, kLocalRukusData[555]);
  });

  test('Ruku Data', () async {
    final data = kLocalRukusData;
    int currentSura = 0;
    Map<int, int> totals = {};
    for (var item in data.values) {
      totals[item.startIndexSura] =
          (totals[item.startIndexSura] ?? 0) + item.numOfAyas;
    }
    // print(totals);
    List<NQSurahTitle> surah = await NobleQuran.getSurahList();
    for (var s in surah) {
      if (s.totalVerses != totals[s.number - 1]) {
        print(
            "sura ${s.number} = ${s.translationEn} = ${s.totalVerses} = ${totals[s.number - 1]}");
      }
      expect(s.totalVerses, totals[s.number - 1]);
    }
  });
}
