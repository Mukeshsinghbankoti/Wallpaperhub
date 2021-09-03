import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_hub/Api/api.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/models/categries_model.dart';
import 'package:wallpaper_hub/models/wallpaper_model.dart';
import 'package:wallpaper_hub/widgets/widget.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoriesModels> categories = <CategoriesModels>[];
  List<WallpaperModel> wallpaerModlelists = [];

  getTrandingWallpaper() async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=nature&per_page=100&page=1"),
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
    getTrandingWallpaper();
    categories = getCategories() as List<CategoriesModels>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    return CategorieTile(
                        title: categories[index].categoriesName,
                        imageUrl: categories[index].imageUrl);
                  },
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
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

class CategorieTile extends StatelessWidget {
  final String imageUrl, title;
  CategorieTile({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            height: 50,
            width: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
