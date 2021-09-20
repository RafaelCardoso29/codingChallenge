import 'package:challenge/network/models/album_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable()
class Artist {
  String name;
  String listeners;
  String mbid;
  String url;
  String streamable;
  List<ContentImage> image;

  Artist({
    this.name,
    this.listeners,
    this.mbid,
    this.url,
    this.streamable,
    this.image,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
