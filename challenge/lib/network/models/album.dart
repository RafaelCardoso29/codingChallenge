import 'package:challenge/network/models/album_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  String name;
  String artist;
  String url;
  String streamable;
  String mbid;
  List<ContentImage> image;

  Album({this.name, this.artist, this.url, this.streamable, this.mbid});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
