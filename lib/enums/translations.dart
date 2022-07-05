enum NQTranslation { SAHIH, HILALI }

extension NQTranslationExtension on NQTranslation {
  String get rawValue {
    switch (this) {
      case NQTranslation.SAHIH:
        return 'sahih';
      case NQTranslation.HILALI:
        return 'hilali';
      default:
        return 'hilali';
    }
  }
}
