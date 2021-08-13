// To parse this JSON data, do
//
//     final albums = albumsFromJson(jsonString);

class Albums {
  Albums(
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  );

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;



  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
