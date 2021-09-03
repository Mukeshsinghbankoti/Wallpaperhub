import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/models/wallpaper_model.dart';
import 'package:wallpaper_hub/widgets/widget.dart';

class Categories extends StatefulWidget {
  final String searchquery;
  Categories({required this.searchquery});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
