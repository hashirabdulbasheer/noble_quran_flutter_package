# noble_quran

A flutter package to access Noble Quran verses/ayats. The package provides methods to return the Noble Quran
ayats in arabic, translation, transliteration and word by word formats.

The following methods are available in the NobleQuran class (See example code for usage):
1) surahListScreen:
   Returns a widget with the list of surah titles for table of contents.

2) getSurahList:
   Returns a list of SurahTitles containing the surah title and relevant information

3) getSurahTitleAtIndex:
   Returns the SurahTitle at an index

4) getSurahWordByWord:
   Returns the Word by Word ayats of a Surah

5) getSurahArabic:
   Returns the arabic ayats of a surah

6) getSurahTransliteration:
   Returns the transliteration ayats of a surah

7) getTranslationString:
   Returns the translation of a surah

## Documentation

doc/api folder

## Installation

Include the following dependency in your app's pubspec.yaml

noble_quran:
<br />&nbsp;&nbsp;&nbsp;&nbsp;git:
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;url: https://github.com/hashirabdulbasheer/noble_quran_flutter_package.git
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ref: master

## Getting Started With Flutter

This project is a starting point for a Dart [package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
