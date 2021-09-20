// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    albummatches: json['albummatches'] == null
        ? null
        : AlbumMatches.fromJson(json['albummatches'] as Map<String, dynamic>),
    artistmatches: json['artistmatches'] == null
        ? null
        : ArtistMatches.fromJson(json['artistmatches'] as Map<String, dynamic>),
  )..trackmatches = json['trackmatches'] == null
      ? null
      : TrackMatches.fromJson(json['trackmatches'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'albummatches': instance.albummatches,
      'artistmatches': instance.artistmatches,
      'trackmatches': instance.trackmatches,
    };
