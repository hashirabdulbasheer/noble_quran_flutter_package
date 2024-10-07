import 'package:flutter/material.dart';

import '../models/surah_title.dart';

class QuranSurahTitleRowWidget extends StatelessWidget {
  final NQSurahTitle surah;

  const QuranSurahTitleRowWidget({
    Key? key,
    required this.surah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color surahIndexColor = Colors.black26;
    Color surahNameColor = Colors.black12;
    Color textColor = Colors.black;
    surahIndexColor = Colors.black26;
    surahNameColor = Colors.black12;
    textColor = Colors.black;

    return Row(
      children: <Widget>[
        Container(
          child: Text(
            "${surah.number}",
            style: TextStyle(
              fontSize: 30,
              color: textColor,
            ),
          ),
          height: 50,
          color: surahIndexColor,
          width: 50,
          alignment: Alignment(
            0,
            0,
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${surah.transliterationEn}",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      5,
                      0,
                      0,
                      5,
                    ),
                    child: Text(
                      "${surah.translationEn}",
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(
              10,
              0,
              10,
              0,
            ),
            color: surahNameColor,
            height: 50,
            alignment: Alignment(
              -1,
              0,
            ),
          ),
        ),
      ],
    );
  }
}
