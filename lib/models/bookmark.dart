/// A bookmark class that can be used to serialize and save the details of an ayat in preferences.
class NQBookmark {
  int surah;
  int ayat;
  int word;
  int seconds;
  double pixels;

  NQBookmark(
      {required this.surah,
      required this.ayat,
      required this.word,
      required this.seconds,
      required this.pixels});

  factory NQBookmark.fromJson(Map<String, dynamic> json) => NQBookmark(
      surah: json["surah"],
      ayat: json["ayat"],
      word: json["word"],
      seconds: json["seconds"],
      pixels: json["pixels"]);

  Map<String, dynamic> toJson() =>
      {"surah": surah, "ayat": ayat, "word": word, "seconds": seconds, "pixels": pixels};
}
