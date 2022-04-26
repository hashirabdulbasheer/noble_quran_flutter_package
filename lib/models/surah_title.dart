
/// Surah Title for Table of Contents
class NQSurahTitle {
  int number;
  String name;
  String transliterationEn;
  String translationEn;
  int totalVerses;
  RevelationType revelationType;

  NQSurahTitle({
    required this.number,
    required this.name,
    required this.transliterationEn,
    required this.translationEn,
    required this.totalVerses,
    required this.revelationType,
  });

  factory NQSurahTitle.fromJson(Map<String, dynamic> json) => NQSurahTitle(
        number: json["number"],
        name: json["name"],
        transliterationEn: json["transliteration_en"],
        translationEn: json["translation_en"],
        totalVerses: json["total_verses"],
        revelationType: revelationTypeValues.map[json["revelation_type"]] ?? RevelationType.NA,
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "transliteration_en": transliterationEn,
        "translation_en": translationEn,
        "total_verses": totalVerses,
        "revelation_type": revelationTypeValues.reverse[revelationType],
      };
}

enum RevelationType { MECCAN, MEDINAN, NA }

final revelationTypeValues =
    EnumValues({"Meccan": RevelationType.MECCAN, "Medinan": RevelationType.MEDINAN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return reverseMap ?? map.map((k, v) => new MapEntry(v, k));
  }
}
