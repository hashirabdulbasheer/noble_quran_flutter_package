/// A bookmark class that can be used to serialize and save the details of an ayat in preferences.
class NQBookmark {
  int surah;
  int ayat;
  int? word;
  int? seconds;
  double? pixels;

  NQBookmark({
    required this.surah,
    required this.ayat,
    this.word,
    this.seconds,
    this.pixels,
  });

  factory NQBookmark.fromJson(Map<String, dynamic> json) => NQBookmark(
        surah: json["surah"] as int,
        ayat: json["ayat"] as int,
        word: json["word"] as int?,
        seconds: json["seconds"] as int?,
        pixels: json["pixels"] as double?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "surah": surah,
        "ayat": ayat,
        "word": word,
        "seconds": seconds,
        "pixels": pixels,
      };
}
