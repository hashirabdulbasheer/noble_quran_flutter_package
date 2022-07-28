enum NQTranslation { SAHIH, HILALI, CLEAR }

extension NQTranslationExtension on NQTranslation {
  String get rawValue {
    switch (this) {
      case NQTranslation.SAHIH:
        return 'sahih';
      case NQTranslation.HILALI:
        return 'hilali';
      case NQTranslation.CLEAR:
        return 'clear';
      default:
        return 'hilali';
    }
  }
}
