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

  factory NQSurahTitle.fromJson(dynamic json) => NQSurahTitle(
        number: json["number"] as int,
        name: json["name"] as String,
        transliterationEn: json["transliteration_en"] as String,
        translationEn: json["translation_en"] as String,
        totalVerses: json["total_verses"] as int,
        revelationType: revelationTypeValues.map[json["revelation_type"]] ??
            RevelationType.NA,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "number": number,
        "name": name,
        "transliteration_en": transliterationEn,
        "translation_en": translationEn,
        "total_verses": totalVerses,
        "revelation_type": revelationTypeValues.reverse[revelationType],
      };

  @override
  String toString() {
    return '$number $transliterationEn';
  }
}

enum RevelationType { MECCAN, MEDINAN, NA }

final revelationTypeValues = EnumValues({
  "Meccan": RevelationType.MECCAN,
  "Medinan": RevelationType.MEDINAN,
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  Map<T, String> get reverse {
    return reverseMap ??
        map.map(
          (
            k,
            v,
          ) =>
              new MapEntry(
            v,
            k,
          ),
        );
  }

  EnumValues(this.map);
}
