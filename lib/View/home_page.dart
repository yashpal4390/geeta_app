// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:geeta_app/View/detail_page.dart';
import 'package:provider/provider.dart';

import '../Controller/geeta_provider.dart';

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
    var gp = Provider.of<GeetaProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<GeetaProvider>(
            builder: (context, GeetaProvider value, child) => Switch(
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
          Container(
            height: MediaQuery.sizeOf(context).height * 0.3,
            width: MediaQuery.sizeOf(context).width * 1,
            margin: EdgeInsetsDirectional.all(8),
            padding: EdgeInsetsDirectional.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/Geeta_Bg.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12)),
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
            child: ListView.builder(
              itemCount: gp.allChapters.length,
              itemBuilder: (context, index) {
                var sample = gp.allChapters[index];
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
              },
            ),
          )
        ],
      ),
    );
  }
}
