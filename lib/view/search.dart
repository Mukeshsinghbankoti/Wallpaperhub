import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/models/wallpaper_model.dart';
import 'package:wallpaper_hub/widgets/widget.dart';
import 'package:http/http.dart' as http;

class SearchApp extends StatefulWidget {
  final String searchquery;
  SearchApp({required this.searchquery});
  @override
  _SearchAppState createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  TextEditingController searchEditcontroller = new TextEditingController();
  List<WallpaperModel> wallpaerModlelists = [];
  getTrandingWallpaper(String querys) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$querys&per_page=10&page=1"),
        headers: {"Authorization": apikey});

    Map<String, dynamic> jsondata = jsonDecode(response.body);
    jsondata["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel.fromMap(element);

      wallpaerModlelists.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getTrandingWallpaper(widget.searchquery);
    super.initState();
    searchEditcontroller.text = widget.searchquery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchEditcontroller,
                        decoration: InputDecoration(
                            hintText: "search", border: InputBorder.none),
                      ),
                    ),
                    InkWell(child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              wallpaperListWidget(
                  context: context, wallpaerModlelist: wallpaerModlelists)
            ],
          ),
        ),
      ),
    );
  }
}
