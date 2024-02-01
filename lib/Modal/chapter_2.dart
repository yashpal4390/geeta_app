// To parse this JSON data, do
//
//     final chapterTwo = chapterTwoFromJson(jsonString);

import 'dart:convert';

List<ChapterTwo> chapterTwoFromJson(String str) => List<ChapterTwo>.from(json.decode(str).map((x) => ChapterTwo.fromJson(x)));

String chapterTwoToJson(List<ChapterTwo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChapterTwo {
  String? verse;
  String? san;
  String? en;
  String? guj;
  String? hi;

  ChapterTwo({
    this.verse,
    this.san,
    this.en,
    this.guj,
    this.hi,
  });

  factory ChapterTwo.fromJson(Map<String, dynamic> json) => ChapterTwo(
    verse: json["verse"],
    san: json["san"],
    en: json["en"],
    guj: json["guj"],
    hi: json["hi"],
  );

  Map<String, dynamic> toJson() => {
    "verse": verse,
    "san": san,
    "en": en,
    "guj": guj,
    "hi": hi,
  };
}
