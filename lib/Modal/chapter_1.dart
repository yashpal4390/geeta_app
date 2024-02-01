// To parse this JSON data, do
//
//     final chapterOne = chapterOneFromJson(jsonString);

import 'dart:convert';

List<ChapterOne> chapterOneFromJson(String str) => List<ChapterOne>.from(json.decode(str).map((x) => ChapterOne.fromJson(x)));

String chapterOneToJson(List<ChapterOne> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChapterOne {
  String? verse;
  String? san;
  String? en;
  String? guj;
  String? hi;

  ChapterOne({
    this.verse,
    this.san,
    this.en,
    this.guj,
    this.hi,
  });

  factory ChapterOne.fromJson(Map<String, dynamic> json) => ChapterOne(
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
