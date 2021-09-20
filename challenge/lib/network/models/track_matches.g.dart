// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_matches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackMatches _$TrackMatchesFromJson(Map<String, dynamic> json) {
  return TrackMatches(
    track: (json['track'] as List)
        ?.map(
            (e) => e == null ? null : Track.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TrackMatchesToJson(TrackMatches instance) =>
    <String, dynamic>{
      'track': instance.track,
    };
