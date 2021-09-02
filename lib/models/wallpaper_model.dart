class WallpaperModel {
  String photographer;
  String photographerUrl;
  int photographer_id;
  SrcModel srcModel;

  WallpaperModel(
      {required this.photographer,
      required this.photographerUrl,
      required this.photographer_id,
      required this.srcModel});
  // WallpaperModel({this.photographer,this.photographerUrl,this.photographer,this.photographer_id,this.srcModel})

  factory WallpaperModel.fromMap(Map<String, dynamic> jsondata) {
    return WallpaperModel(
        photographer: jsondata["photographer"],
        photographerUrl: jsondata["photographer_url"],
        photographer_id: jsondata["photographer_id"],
        srcModel: SrcModel.fromMap(jsondata["src"]));
  }
}

class SrcModel {
  String original;

  String small;
  String portrait;

  SrcModel(
      {required this.original, required this.small, required this.portrait});
  factory SrcModel.fromMap(Map<String, dynamic> jsondata) {
    return SrcModel(
        original: jsondata["original"],
        small: jsondata["small"],
        portrait: jsondata["portrait"]);
  }
}
