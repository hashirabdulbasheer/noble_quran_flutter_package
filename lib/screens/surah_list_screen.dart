import 'package:flutter/material.dart';
import '../models/surah_title.dart';
import '../noble_quran.dart';
import 'surah_title_row_widget.dart';

class NobleQuranSurahListScreen extends StatelessWidget {
  final Function(NQSurahTitle) onSurahSelected;

  NobleQuranSurahListScreen({required this.onSurahSelected});

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<NQSurahTitle>>(
      future: NobleQuran.getSurahList(), // async work
      builder: (
        BuildContext context,
        AsyncSnapshot<List<NQSurahTitle>> snapshot,
      ) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else {
              List<NQSurahTitle> surahs = snapshot.data ?? [];

              return Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  10,
                  0,
                  0,
                ),
                child: new ListView.builder(
                  itemCount: surahs.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return ListTile(
                      title: QuranSurahTitleRowWidget(surah: surahs[index]),
                      onTap: () => onSurahSelected(
                        surahs[index],
                      ),
                    );
                  },
                ),
              );
            }
        }
      },
    );
  }
}
