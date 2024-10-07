// To parse this JSON data, do
//
//     final quranReciter = quranReciterFromJson(jsonString);

import 'dart:convert';

List<QuranReciter> quranReciterFromJson(String str) => List<QuranReciter>.from(
      (json.decode(str) as List<Map<String, dynamic>>).map<QuranReciter>(
        (Map<String, dynamic> x) => QuranReciter.fromJson(x),
      ),
    );

String quranReciterToJson(List<QuranReciter> data) => json.encode(
      List<dynamic>.from(
        data.map<Map<String, dynamic>>(
          (x) => x.toJson(),
        ),
      ),
    );

class QuranReciter {
  String subfolder;
  String name;
  String bitrate;

  QuranReciter({
    required this.subfolder,
    required this.name,
    required this.bitrate,
  });

  factory QuranReciter.fromJson(Map<String, dynamic> json) => QuranReciter(
        subfolder: json["subfolder"] as String,
        name: json["name"] as String,
        bitrate: json["bitrate"] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "subfolder": subfolder,
        "name": name,
        "bitrate": bitrate,
      };
}
