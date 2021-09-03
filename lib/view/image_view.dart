import 'package:flutter/material.dart';

class ImageViewFull extends StatefulWidget {
  final String imageurl;
  ImageViewFull({required this.imageurl});

  @override
  _ImageViewFullState createState() => _ImageViewFullState();
}

class _ImageViewFullState extends State<ImageViewFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imageurl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imageurl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)])),
                  child: Column(
                    children: [
                      Text("Set wallpaper"),
                      Text("image will be save in gallery")
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
