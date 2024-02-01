// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../Controller/geeta_provider.dart';

class DetailPage extends StatefulWidget {
  int chapterNumber;
  String? chapter_summary;
  String? name;
  String? json_path;
  String? img_path;

  DetailPage(
      {Key? key,
      required this.chapterNumber,
      required this.chapter_summary,
      required this.img_path,
      required this.name,
      required this.json_path})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    var gp = Provider.of<GeetaProvider>(context, listen: false);
    gp.loadJsonChapter1(widget.json_path ?? "");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String img = widget.img_path ?? "";
    // String path = "assets/image/$img.jpg";
    var gp = Provider.of<GeetaProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CHAPTER ${widget.chapterNumber}",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.name}",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Consumer<GeetaProvider>(
            builder:
                (BuildContext context, GeetaProvider value, Widget? child) {
              return Container(
                margin: EdgeInsetsDirectional.only(top: 8, end: 20, start: 20),
                child: Text(
                  "${widget.chapter_summary}",
                  maxLines: (value.showMore == true) ? null : 4,
                  overflow:
                      (value.showMore == true) ? null : TextOverflow.ellipsis,
                ),
              );
            },
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (gp.showMore == false) {
                    gp.sMore();
                  } else {
                    gp.sLess();
                  }
                },
                child: Consumer<GeetaProvider>(
                  builder: (BuildContext context, GeetaProvider value,
                      Widget? child) {
                    return Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 8, end: 20, start: 20),
                      child: (gp.showMore == false)
                          ? Text("SHOW MORE",
                              style: TextStyle(color: Colors.grey))
                          : Text("SHOW LESS",
                              style: TextStyle(color: Colors.grey)),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ToggleSwitch(
            minWidth: 90.0,
            cornerRadius: 20,
            labels: ['English', 'Gujrati', 'Sanskrit'],
            onToggle: (val) {
              gp.setToogleIndex(val);
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: Consumer<GeetaProvider>(
              builder:
                  (BuildContext context, GeetaProvider value, Widget? child) {
                return ListView.builder(
                  itemCount: gp.chapterOne.length,
                  itemBuilder: (context, index) {
                    var sample = gp.chapterOne[index];
                    String title = sample.en ?? "";
                    if (value.toggleIndex == 1) {
                      title = sample.guj ?? "";
                    } else if (value.toggleIndex == 2) {
                      title = sample.san ?? "";
                    }
                    return Column(
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              Icon(Icons.menu_book),
                              SizedBox(width: 10),
                              Text("Verse ${sample.verse ?? ""}"),
                            ],
                          ),
                          subtitle: Text(title),
                        ),
                        Divider(
                          color: Colors.black,
                          height: 1, // Thickness of the divider line
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
