// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geeta_app/Modal/chapter_2.dart';

import '../Modal/all_chapter_modal.dart';
import '../Modal/chapter_1.dart';

class GeetaProvider extends ChangeNotifier {
  bool isDark = false;
  bool showMore = false;
  int? toggleIndex;
  List<AllChapter> allChapters = [];
  List<ChapterOne> chapterOne = [];
  List<ChapterTwo> chapterTwo = [];

  void refresh() {
    notifyListeners();
  }

  void sMore() {
    showMore = true;
    notifyListeners();
  }

  void sLess() {
    showMore = false;
    notifyListeners();
  }

  void setToogleIndex(int? val) {
    toggleIndex = val;
    notifyListeners();
  }

  void changeTheme(bool val) {
    isDark = val;
    notifyListeners();
  }

  Future<void> loadJson() async {
    var fileData = await rootBundle.loadString("lib/Data/all_chapters.json");
    jsonDecode(fileData);
    allChapters = allChapterFromJson(fileData);
  }

  Future<void> loadJsonChapter1(String Url) async {
    var fileData = await rootBundle.loadString(Url);
    if (Url == "lib/utils/json/chapter_1.json") {
      jsonDecode(fileData);
      chapterOne = chapterOneFromJson(fileData);
    } else if (Url == "lib/utils/json/chapter_2.json") {
      jsonDecode(fileData);
      chapterTwo = chapterTwoFromJson(fileData);
    }
  }
}
