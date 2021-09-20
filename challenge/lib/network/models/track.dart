import 'package:challenge/network/models/album_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  String name;
  String artist;
  String url;
  String listeners;
  String mbid;
  List<ContentImage> image;

  Track({
    this.name,
    this.artist,
    this.url,
    this.listeners,
    this.image,
    this.mbid,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
