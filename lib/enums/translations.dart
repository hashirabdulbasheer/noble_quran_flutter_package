enum NQTranslation { sahih, hilali, haleem, clear, wahiduddinkhan, malayalam_abdulhameed, malayalam_karakunnu, urdu_maududi }

extension NQTranslationExtension on NQTranslation {
  String get rawValue {
    switch (this) {
      case NQTranslation.sahih:
        return 'sahih';
      case NQTranslation.hilali:
        return 'hilali';
      case NQTranslation.clear:
        return 'clear';
      case NQTranslation.haleem:
        return 'en-abdelhaleem';
      case NQTranslation.wahiduddinkhan:
        return 'eng-wahiduddinkhan';
      case NQTranslation.malayalam_abdulhameed:
        return 'ml_abdulhameed';
      case NQTranslation.malayalam_karakunnu:
        return 'ml_karakunnu';
      case NQTranslation.urdu_maududi:
        return 'ur_maududi';
      default:
        return 'clear';
    }
  }

  String get title {
    switch (this) {
      case NQTranslation.sahih:
        return 'Sahih International';
      case NQTranslation.hilali:
        return 'Hilali & Khan';
      case NQTranslation.clear:
        return 'Clear Quran';
      case NQTranslation.haleem:
        return 'Abdel Haleem';
      case NQTranslation.wahiduddinkhan:
        return 'Wahiduddin Khan';
      case NQTranslation.malayalam_abdulhameed:
        return 'അബ്ദുല്‍ ഹമീദ് & പറപ്പൂര്‍';
      case NQTranslation.malayalam_karakunnu:
        return 'കാരകുന്ന് & എളയാവൂര്‍';
      case NQTranslation.urdu_maududi:
        return 'ابوالاعلی مودودی';
      default:
        return 'Clear Quran';
    }
  }

}
