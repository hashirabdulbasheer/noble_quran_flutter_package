import 'package:flutter/material.dart';
import 'package:noble_quran/enums/translations.dart';
import 'package:noble_quran/models/surah.dart';
import 'package:noble_quran/models/surah_title.dart';
import 'package:noble_quran/models/word.dart';
import 'package:noble_quran/noble_quran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SurahTOCScreen()),
                          );
                        },
                        child: const Text("Noble Quran Table of Contents")),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          NobleQuran.getSurahList().then((surahList) {
                            String surahListStr = "";
                            for (NQSurahTitle title in surahList) {
                              surahListStr += "${title.name} - ${title.translationEn}\n";
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(title: "Surah List", details: surahListStr)),
                            );
                          });
                        },
                        child: const Text("getSurahList()")),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          NobleQuran.getSurahTitleAtIndex(2).then((title) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        title: title.name,
                                        details: "${title.name} - ${title.translationEn}",
                                      )),
                            );
                          });
                        },
                        child: const Text("getSurahTitleAtIndex(2)")),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          NobleQuran.getSurahWordByWord(111).then((ayats) {
                            String ayatsStr = "";
                            for (NQWord word in ayats[0]) {
                              ayatsStr += "${word.ar} - ${word.tr}\n";
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(title: "Surah 111", details: ayatsStr)),
                            );
                          });
                        },
                        child: const Text("getSurahWordByWord(111)")),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          NobleQuran.getSurahArabic(111).then((surah) {
                            String ayatsStr = "";
                            for (NQAyat word in surah.aya) {
                              ayatsStr += "${word.index} - ${word.text}\n";
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(title: "Surah 111", details: ayatsStr)),
                            );
                          });
                        },
                        child: const Text("getSurahArabic(111)")),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          NobleQuran.getSurahTransliteration(111).then((surah) {
                            String ayatsStr = "";
                            for (NQAyat word in surah.aya) {
                              ayatsStr += "${word.index} - ${word.text}\n";
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(title: "Surah 111", details: ayatsStr)),
                            );
                          });
                        },
                        child: const Text("getSurahTransliteration(111)")),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          NobleQuran.getTranslationString(111, NQTranslation.CLEAR).then((surah) {
                            String ayatsStr = "";
                            for (NQAyat word in surah.aya) {
                              ayatsStr += "${word.index} - ${word.text}\n";
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(title: "Surah 111", details: ayatsStr)),
                            );
                          });
                        },
                        child: const Text("getTranslationString(111, CLEAR)")),
                  ),
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// To display Table of Contents
class SurahTOCScreen extends StatelessWidget {
  const SurahTOCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Surah TOC")),
      body: NobleQuran.surahListScreen((p0) => () {}),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String title;
  final String details;

  const DetailsScreen({Key? key, required this.title, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Text(details),
      ),
    );
  }
}
