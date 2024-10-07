import 'dart:convert';

List<NQSurah> nqSurahArabicFromJson(String str) =>
    List<NQSurah>.from((json.decode(str) as List<Map<String, dynamic>>)
        .map<NQSurah>((x) => NQSurah.fromJson(x)));

String nqSurahArabicToJson(List<NQSurah> data) => json.encode(
      List<dynamic>.from(
        data.map<Map<String, dynamic>>(
          (NQSurah x) => x.toJson(),
        ),
      ),
    );

/// Surah model - the model that holds the details of a Surah
class NQSurah {
  final List<NQAyat> aya;
  final String index;
  final String? name;

  NQSurah({
    required this.aya,
    required this.index,
    required this.name,
  });

  factory NQSurah.fromJson(Map<String, dynamic> json) => NQSurah(
        aya: nqAyatArabicFromJson(json["aya"] as List<dynamic>),
        index: json["index"] as String,
        name: json["name"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "aya": List<dynamic>.from(
          aya.map<Map<String, dynamic>>((x) => x.toJson()),
        ),
        "index": index,
        "name": name,
      };
}

/// Ayat model - the model that holds the details of an Ayat
List<NQAyat> nqAyatArabicFromJson(List<dynamic> ayat) =>
    List<NQAyat>.from(ayat.map<NQAyat>((x) => NQAyat.fromJson(x)));

class NQAyat {
  final String index;
  final String text;

  NQAyat({
    required this.index,
    required this.text,
  });

  factory NQAyat.fromJson(dynamic json) => NQAyat(
        index: json["index"] as String,
        text: json["text"] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "index": index,
        "text": text,
      };
}
