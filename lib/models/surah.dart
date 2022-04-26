import 'dart:convert';

List<NQSurah> nqSurahArabicFromJson(String str) =>
    List<NQSurah>.from(json.decode(str).map((x) => NQSurah.fromJson(x)));

String nqSurahArabicToJson(List<NQSurah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Surah model - the model that holds the details of a Surah
class NQSurah {
  NQSurah({
    required this.aya,
    required this.index,
    required this.name,
  });

  final List<NQAyat> aya;
  final String index;
  final String? name;

  factory NQSurah.fromJson(Map<String, dynamic> json) => NQSurah(
        aya: List<NQAyat>.from(json["aya"].map((x) => NQAyat.fromJson(x))),
        index: json["index"],
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "aya": List<dynamic>.from(aya.map((x) => x.toJson())),
        "index": index,
        "name": name,
      };
}

/// Ayat model - the model that holds the details of an Ayat
class NQAyat {
  NQAyat({
    required this.index,
    required this.text,
  });

  final String index;
  final String text;

  factory NQAyat.fromJson(Map<String, dynamic> json) => NQAyat(
        index: json["index"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "text": text,
      };
}
