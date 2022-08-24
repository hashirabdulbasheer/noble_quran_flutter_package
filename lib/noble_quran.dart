library noblequran;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/path_constants.dart';
import 'enums/translations.dart';
import 'models/surah.dart';
import 'models/surah_title.dart';
import 'models/word.dart';
import 'screens/surah_list_screen.dart';

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
    String surahListJsonStr =
        await rootBundle.loadString(NQPathConstants.surahListPath);
    List<NQSurahTitle> surahFromJson = List<NQSurahTitle>.from(
        json.decode(surahListJsonStr).map((x) => NQSurahTitle.fromJson(x)));
    return surahFromJson;
  }

  ///  Returns the SurahTitle at an index
  ///  Parameter: index as int of the required surah
  ///  Returns: SurahTitle containing the title and details of the Surah
  static Future<NQSurahTitle> getSurahTitleAtIndex(int index) async {
    String surahListJsonStr =
        await rootBundle.loadString(NQPathConstants.surahListPath);
    List<NQSurahTitle> surahFromJson = List<NQSurahTitle>.from(
        json.decode(surahListJsonStr).map((x) => NQSurahTitle.fromJson(x)));
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
    Map<String, dynamic> jsonDict = json.decode(quranArabicJson);
    return NQSurah.fromJson(jsonDict["quran"]["sura"][surahIndex]);
  }

  ///  Returns the transliteration ayats of a surah
  ///  Parameter: index as int of the required surah
  ///  Returns: NQSurah containing the arabic ayats
  static Future<NQSurah> getSurahTransliteration(int surahIndex) async {
    String quranArabicJson =
        await rootBundle.loadString(NQPathConstants.quranTransliterationPath);
    Map<String, dynamic> jsonDict = json.decode(quranArabicJson);
    return NQSurah.fromJson(jsonDict["quran"]["sura"][surahIndex]);
  }

  ///  Returns the translation of a surah
  ///  Parameter:
  ///     index as int of the required surah
  ///     translation as NQTranslation
  ///  Returns: NQSurah containing the translated ayats
  static Future<NQSurah> getTranslationString(
      int surahIndex, NQTranslation translation) async {
    String translationJsonStr = await rootBundle.loadString(
        '${NQPathConstants.quranTranslationPath}/${translation.rawValue}.json');
    Map<String, dynamic> fullQuranTranslationMap =
        json.decode(translationJsonStr);
    return NQSurah.fromJson(
        fullQuranTranslationMap["quran"]["sura"][surahIndex]);
  }

  /// Returns a list of all translations available
  static List<NQTranslation> getAllTranslations() {
    return [
      NQTranslation.clear,
      NQTranslation.sahih,
      NQTranslation.hilali,
      NQTranslation.malayalam_abdulhameed,
      NQTranslation.malayalam_karakunnu,
      NQTranslation.urdu_maududi
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
    }
    return NQTranslation.clear;
  }


}
