import 'package:challenge/network/models/album.dart';
import 'package:challenge/network/models/album_matches.dart';
import 'package:challenge/network/models/artist_matches.dart';
import 'package:challenge/network/models/track_matches.dart';
import 'package:json_annotation/json_annotation.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  AlbumMatches albummatches;
  ArtistMatches artistmatches;
  TrackMatches trackmatches;

  Results({this.albummatches, this.artistmatches});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
