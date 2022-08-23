enum NQTranslation { SAHIH, HILALI, CLEAR, MALAYALAM_MUNDAM }

extension NQTranslationExtension on NQTranslation {
  String get rawValue {
    switch (this) {
      case NQTranslation.SAHIH:
        return 'sahih';
      case NQTranslation.HILALI:
        return 'hilali';
      case NQTranslation.CLEAR:
        return 'clear';
      case NQTranslation.MALAYALAM_MUNDAM:
        return 'malayalam_mundam';
      default:
        return 'hilali';
    }
  }
}
