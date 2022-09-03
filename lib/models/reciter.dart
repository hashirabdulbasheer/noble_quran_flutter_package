// To parse this JSON data, do
//
//     final quranReciter = quranReciterFromJson(jsonString);

import 'dart:convert';

List<QuranReciter> quranReciterFromJson(String str) => List<QuranReciter>.from(
    json.decode(str).map((x) => QuranReciter.fromJson(x)));

String quranReciterToJson(List<QuranReciter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuranReciter {
  QuranReciter({
    required this.subfolder,
    required this.name,
    required this.bitrate,
  });

  String subfolder;
  String name;
  String bitrate;

  factory QuranReciter.fromJson(Map<String, dynamic> json) => QuranReciter(
        subfolder: json["subfolder"],
        name: json["name"],
        bitrate: json["bitrate"],
      );

  Map<String, dynamic> toJson() => {
        "subfolder": subfolder,
        "name": name,
        "bitrate": bitrate,
      };
}
