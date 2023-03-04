import 'dart:convert';


List<List<NQWord>> nqWordFromJson(String str) {
  dynamic result = json.decode(str);
  List<List<NQWord>> resultList = [];
  for(var x in result) {
    List<NQWord> ayaList = [];
     for( var y in x) {
       ayaList.add(NQWord.fromJson(y));
     }
    resultList.add(ayaList);
  }

  return resultList;

  // TODO: Optimize later
  // List<List<NQWord>> nqWordFromJson(String str) => List<List<NQWord>>.from(
  //   (json.decode(str) as List<List<Map<String, dynamic>>>).map<List<NQWord>>(
  //         (x) => List<NQWord>.from(
  //       x.map<NQWord>(
  //             (y) => NQWord.fromJson(y),
  //       ),
  //     ),
  //   ),
  // );

}

String nqWordToJson(List<List<NQWord>> data) =>
    json.encode(
      List<dynamic>.from(
        data.map<List<dynamic>>(
              (x) =>
          List<NQWord>.from(
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

  factory NQWord.fromJson(dynamic json) =>
      NQWord(
        word: json["word"] as int,
        tr: json["tr"] as String,
        aya: json["aya"] as int,
        sura: json["sura"] as int,
        ar: json["ar"] as String,
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        "word": word,
        "tr": tr,
        "aya": aya,
        "sura": sura,
        "ar": ar,
      };
}
