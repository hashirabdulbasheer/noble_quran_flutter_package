import 'dart:convert';

List<List<NQWord>> nqWordFromJson(String str) => List<List<NQWord>>.from(
    json.decode(str).map((x) => List<NQWord>.from(x.map((x) => NQWord.fromJson(x)))));

String nqWordToJson(List<List<NQWord>> data) =>
    json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

/// Word model for word by word
class NQWord {
  NQWord({
    required this.word,
    required this.tr,
    required this.aya,
    required this.sura,
    required this.ar,
  });

  final int word;
  final String tr;
  final int aya;
  final int sura;
  final String ar;

  factory NQWord.fromJson(Map<String, dynamic> json) => NQWord(
        word: json["word"],
        tr: json["tr"],
        aya: json["aya"],
        sura: json["sura"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "tr": tr,
        "aya": aya,
        "sura": sura,
        "ar": ar,
      };
}
