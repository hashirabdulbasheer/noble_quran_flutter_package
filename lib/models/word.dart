import 'dart:convert';


List<List<NQWord>> nqWordFromJson(String str) {
  List<List<NQWord>> result = (json.decode(str) as List)
      .map<List<NQWord>>((e) =>
          e.map<NQWord>((f) => NQWord.fromJson(f)).toList() as List<NQWord>)
      .toList();

  return result;
}

String nqWordToJson(List<List<NQWord>> data) => json.encode(
      List<dynamic>.from(
        data.map<List<dynamic>>(
          (x) => List<NQWord>.from(
            x.map<Map<String, dynamic>>(
              (x) => x.toJson(),
            ),
          ),
        ),
      ),
    );

/// Word model for word by word
class NQWord {
  final int word;
  final String tr;
  final int aya;
  final int sura;
  final String ar;

  NQWord({
    required this.word,
    required this.tr,
    required this.aya,
    required this.sura,
    required this.ar,
  });

  factory NQWord.fromJson(dynamic json) => NQWord(
        word: json["word"] as int,
        tr: json["tr"] as String,
        aya: json["aya"] as int,
        sura: json["sura"] as int,
        ar: json["ar"] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "word": word,
        "tr": tr,
        "aya": aya,
        "sura": sura,
        "ar": ar,
      };
}
