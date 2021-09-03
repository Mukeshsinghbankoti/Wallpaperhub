import 'package:flutter/material.dart';
import 'package:wallpaper_hub/models/wallpaper_model.dart';
import 'package:wallpaper_hub/view/image_view.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.blue),
      ),
      Text("Hub", style: TextStyle(color: Colors.red))
    ],
  );
}

Widget wallpaperListWidget({context, List<WallpaperModel>? wallpaerModlelist}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 6.0,
        childAspectRatio: 0.6,
        crossAxisSpacing: 6.0,
        children: wallpaerModlelist!.map((e) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageViewFull(
                            imageurl: e.srcModel.portrait,
                          )));
            },
            child: Hero(
              tag: e.srcModel.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    e.srcModel.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ));
        }).toList(),
      ));
}
