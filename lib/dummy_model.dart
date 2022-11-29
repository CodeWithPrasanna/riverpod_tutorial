// To parse this JSON data, do
//
//     final dummyData = dummyDataFromJson(jsonString);

import 'dart:convert';

List<DummyData> dummyDataFromJson(String str) =>
    List<DummyData>.from(json.decode(str).map((x) => DummyData.fromJson(x)));

String dummyDataToJson(List<DummyData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DummyData {
  DummyData({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory DummyData.fromJson(Map<String, dynamic> json) => DummyData(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
