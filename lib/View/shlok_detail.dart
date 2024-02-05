// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShlokDetail extends StatefulWidget {
  String? eng;
  String? hindi;
  String? guj;
  String? san;
  String? img;

  ShlokDetail(
      {Key? key,
      required this.eng,
      required this.img,
      required this.hindi,
      required this.guj,
      required this.san})
      : super(key: key);

  @override
  State<ShlokDetail> createState() => _ShlokDetailState();
}

class _ShlokDetailState extends State<ShlokDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verses Details"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.img ?? ""),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
              child: Text("SANSKRIT",style: TextStyle(fontSize: 18)),
            ),
            Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.15,
                margin: EdgeInsetsDirectional.all(8),
                padding: EdgeInsetsDirectional.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey,width: 5),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  widget.san ?? "",
                  style: TextStyle(fontSize: 18),
                ))),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
              child: Text("ENGLISH",style: TextStyle(fontSize: 18)),
            ),
            Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.15,
                margin: EdgeInsetsDirectional.all(8),
                padding: EdgeInsetsDirectional.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey,width: 5),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  widget.eng ?? "",
                  style: TextStyle(fontSize: 18),
                ))),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
              child: Text("HINDI",style: TextStyle(fontSize: 18)),
            ),
            Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.15,
                margin: EdgeInsetsDirectional.all(8),
                padding: EdgeInsetsDirectional.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey,width: 5),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  widget.hindi ?? "",
                  style: TextStyle(fontSize: 18),
                ))),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
              child: Text("GUJARATI",style: TextStyle(fontSize: 18)),
            ),
            Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.15,
                margin: EdgeInsetsDirectional.all(8),
                padding: EdgeInsetsDirectional.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey,width: 5),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  widget.guj ?? "",
                  style: TextStyle(fontSize: 18),
                ))),
          ],
        ),
      ),
    );
  }
}
