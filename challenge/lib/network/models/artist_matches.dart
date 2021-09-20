import 'package:challenge/network/models/album.dart';
import 'package:challenge/network/models/artist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist_matches.g.dart';

@JsonSerializable()
class ArtistMatches {
  List<Artist> artist;

  ArtistMatches({this.artist});

  factory ArtistMatches.fromJson(Map<String, dynamic> json) =>
      _$ArtistMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistMatchesToJson(this);
}
