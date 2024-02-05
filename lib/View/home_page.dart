// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geeta_app/Controller/theme_provider.dart';
import 'package:geeta_app/View/detail_page.dart';
import 'package:provider/provider.dart';

import '../Controller/geeta_provider.dart';
import '../Util/util.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    var gp = Provider.of<GeetaProvider>(context, listen: false);
    gp.loadJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, ThemeProvider value, child) => Switch(
                value: value.isDark,
                onChanged: (val) {
                  value.changeTheme(val);
                }),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Bhagavad Geeta",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: cImage.length,
            itemBuilder: (context, index, realIndex) {
              var ci = cImage[index];
              return Container(
                  clipBehavior: Clip.antiAlias,
                  height: 250,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    ci,
                    fit: BoxFit.cover,
                  ));
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              clipBehavior: Clip.antiAlias,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              height: 300,
              enlargeFactor: 0.2,
              viewportFraction: 0.9,
              pauseAutoPlayOnTouch: true,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 10),
              Text("Chapters",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: Consumer<GeetaProvider>(
              builder:
                  (BuildContext context, GeetaProvider value, Widget? child) {
                if (value.allChapters.isNotEmpty) {
                  return ListView.builder(
                    itemCount: value.allChapters.length,
                    itemBuilder: (context, index) {
                      var sample = value.allChapters[index];
                      if (value.allChapters.isNotEmpty) {
                        return ListTile(
                          style: ListTileStyle.list,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailPage(
                                    chapterNumber: sample.chapterNumber!,
                                    chapter_summary: sample.chapterSummary,
                                    json_path: sample.jsonPath,
                                    name: sample.name,
                                    verses: sample.verses,
                                    img_path: sample.imageName);
                              },
                            ));
                          },
                          leading: CircleAvatar(
                            child: Text("${sample.chapterNumber}"),
                          ),
                          title: Text(sample.name ?? ""),
                          subtitle: Text("Verses :~ ${sample.versesCount}"),
                        );
                      } else if (value.allChapters.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
