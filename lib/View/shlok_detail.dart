// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShlokDetail extends StatefulWidget {
  String? verse;
  String? img;

  ShlokDetail({Key? key, required this.verse, required this.img})
      : super(key: key);

  @override
  State<ShlokDetail> createState() => _ShlokDetailState();
}

class _ShlokDetailState extends State<ShlokDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verses Details"), centerTitle: true),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.img ?? ""),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.3,
              margin: EdgeInsetsDirectional.all(8),
              padding: EdgeInsetsDirectional.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                  child: Text(
                widget.verse ?? "",
                style: TextStyle(fontSize: 18),
              ))),
        ],
      ),
    );
  }
}
