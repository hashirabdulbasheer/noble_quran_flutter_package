library noblequran;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/path_constants.dart';
import 'data/data.dart';
import 'enums/translations.dart';
import 'models/reciter.dart';
import 'models/surah.dart';
import 'models/surah_title.dart';
import 'models/word.dart';
import 'screens/surah_list_screen.dart';
import 'package:intl/intl.dart' as intl;

/// NobleQuran class to access the functionality of the package
class NobleQuran {
  /// Displays a screen with a list of surah titles (Table of Contents)
  ///   Parameter: onSurahSelected -> callback that should be invoked when a surah title is selected
  ///   Returns: Widget containing the list of surah titles
  static Widget surahListScreen(Function(NQSurahTitle) onSurahSelected) {
    return NobleQuranSurahListScreen(onSurahSelected: onSurahSelected);
  }

  /// Returns a list of SurahTitles containing the surah title and relevant information
  ///    SurahTitle contains:
  ///        - number: index of the surah
  ///        - name: arabic name
  ///        - transliterationEn: english transliteration of the arabic name
  ///        - translationEn: english translation of the name
  ///        - totalVerses: total number of verses present in the surah
  ///        - revelationType: revelation type - whether makkan or madani surah
  ///  Parameter: None
  ///  Returns: List of SurahTitle
  static Future<List<NQSurahTitle>> getSurahList() async {
    String surahListJsonStr = await rootBundle.loadString(NQPathConstants.surahListPath);
    dynamic result = json.decode(surahListJsonStr);
    List<NQSurahTitle> surahFromJson = (result as List).map((dynamic e) => NQSurahTitle.fromJson(e),).toList();

    return surahFromJson;
  }

  ///  Returns the SurahTitle at an index
  ///  Parameter: index as int of the required surah
  ///  Returns: SurahTitle containing the title and details of the Surah
  static Future<NQSurahTitle> getSurahTitleAtIndex(int index) async {
    String surahListJsonStr =
        await rootBundle.loadString(NQPathConstants.surahListPath);
    List<NQSurahTitle> surahFromJson = (json.decode(surahListJsonStr) as List).map((dynamic x) => NQSurahTitle.fromJson(x),).toList();

    return surahFromJson[index];
  }

  ///  Returns the Word by Word ayats of a Surah
  ///  Parameter: index as int of the required surah
  ///  Returns: List of Ayats with each ayat containing a List of NQWord
  static Future<List<List<NQWord>>> getSurahWordByWord(int surahIndex) async {
    String wordByWord = await rootBundle
        .loadString('${NQPathConstants.quranPath}/$surahIndex.json');

    return nqWordFromJson(wordByWord);
  }

  ///  Returns the arabic ayats of a surah
  ///  Parameter: index as int of the required surah
  ///  Returns: NQSurah containing the arabic ayats
  static Future<NQSurah> getSurahArabic(int surahIndex) async {
    String quranArabicJson =
        await rootBundle.loadString(NQPathConstants.quranArabicPath);
    dynamic jsonDict = json.decode(quranArabicJson);

    return NQSurah.fromJson(
      jsonDict["quran"]["sura"][surahIndex] as Map<String, dynamic>,
    );
  }

  ///  Returns the transliteration ayats of a surah
  ///  Parameter: index as int of the required surah
  ///  Returns: NQSurah containing the arabic ayats
  static Future<NQSurah> getSurahTransliteration(int surahIndex) async {
    String quranArabicJson =
        await rootBundle.loadString(NQPathConstants.quranTransliterationPath);
    dynamic jsonDict = json.decode(quranArabicJson);

    return NQSurah.fromJson(
      jsonDict["quran"]["sura"][surahIndex] as Map<String, dynamic>,
    );
  }

  ///  Returns the translation of a surah
  ///  Parameter:
  ///     index as int of the required surah
  ///     translation as NQTranslation
  ///  Returns: NQSurah containing the translated ayats
  static Future<NQSurah> getTranslationString(
    int surahIndex,
    NQTranslation translation,
  ) async {
    String translationJsonStr = await rootBundle.loadString(
      '${NQPathConstants.quranTranslationPath}/${translation.rawValue}.json',
    );
    dynamic fullQuranTranslationMap = json.decode(translationJsonStr);

    return NQSurah.fromJson(
      fullQuranTranslationMap["quran"]["sura"][surahIndex]
          as Map<String, dynamic>,
    );
  }

  /// Returns a list of all translations available
  static List<NQTranslation> getAllTranslations() {
    return [
      NQTranslation.haleem,
      NQTranslation.clear,
      NQTranslation.sahih,
      NQTranslation.hilali,
      NQTranslation.wahiduddinkhan,
      NQTranslation.malayalam_abdulhameed,
      NQTranslation.malayalam_karakunnu,
      NQTranslation.urdu_maududi,
    ];
  }

  /// Returns a translation enum from its title string
  static NQTranslation getTranslationFromTitle(String title) {
    if (title == NQTranslation.clear.title) {
      return NQTranslation.clear;
    } else if (title == NQTranslation.sahih.title) {
      return NQTranslation.sahih;
    } else if (title == NQTranslation.hilali.title) {
      return NQTranslation.hilali;
    } else if (title == NQTranslation.malayalam_abdulhameed.title) {
      return NQTranslation.malayalam_abdulhameed;
    } else if (title == NQTranslation.malayalam_karakunnu.title) {
      return NQTranslation.malayalam_karakunnu;
    } else if (title == NQTranslation.urdu_maududi.title) {
      return NQTranslation.urdu_maududi;
    } else if (title == NQTranslation.haleem.title) {
      return NQTranslation.haleem;
    } else if (title == NQTranslation.wahiduddinkhan.title) {
      return NQTranslation.wahiduddinkhan;
    }

    return NQTranslation.clear;
  }

  /// Returns a translation enum from its raw value string
  static NQTranslation getTranslationFromValue(String value) {
    if (value == NQTranslation.clear.rawValue) {
      return NQTranslation.clear;
    } else if (value == NQTranslation.sahih.rawValue) {
      return NQTranslation.sahih;
    } else if (value == NQTranslation.hilali.rawValue) {
      return NQTranslation.hilali;
    } else if (value == NQTranslation.malayalam_abdulhameed.rawValue) {
      return NQTranslation.malayalam_abdulhameed;
    } else if (value == NQTranslation.malayalam_karakunnu.rawValue) {
      return NQTranslation.malayalam_karakunnu;
    } else if (value == NQTranslation.urdu_maududi.rawValue) {
      return NQTranslation.urdu_maududi;
    } else if (value == NQTranslation.haleem.rawValue) {
      return NQTranslation.haleem;
    } else if (value == NQTranslation.wahiduddinkhan.rawValue) {
      return NQTranslation.wahiduddinkhan;
    }

    return NQTranslation.clear;
  }

  /// Returns all reciters
  static List<QuranReciter> getAllReciters() {
    List<Map<String, String>> recitersJson = NQData.recitersJson;

    return recitersJson.map((e) => QuranReciter.fromJson(e)).toList();
  }

  /// Returns the url for the audio recitation of an aya
  static String audioRecitationUrl(
    QuranReciter reciter,
    int surahIndex,
    int ayaIndex,
  ) {
    final intl.NumberFormat formatter = intl.NumberFormat("000");

    return "${NQUrlConstants.audioRecitationBaseUrl}/${reciter.subfolder}/${formatter.format(surahIndex)}${formatter.format(ayaIndex)}.mp3";
  }
}
