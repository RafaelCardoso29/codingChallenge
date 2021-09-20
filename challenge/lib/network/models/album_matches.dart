import 'package:challenge/network/models/album.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_matches.g.dart';

@JsonSerializable()
class AlbumMatches {
  List<Album> album;

  AlbumMatches({this.album});

  factory AlbumMatches.fromJson(Map<String, dynamic> json) =>
      _$AlbumMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumMatchesToJson(this);
}
