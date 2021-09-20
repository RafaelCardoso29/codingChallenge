import 'package:challenge/network/models/track.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_matches.g.dart';

@JsonSerializable()
class TrackMatches {
  List<Track> track;

  TrackMatches({this.track});

  factory TrackMatches.fromJson(Map<String, dynamic> json) =>
      _$TrackMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$TrackMatchesToJson(this);
}
