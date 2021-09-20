// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_matches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistMatches _$ArtistMatchesFromJson(Map<String, dynamic> json) {
  return ArtistMatches(
    artist: (json['artist'] as List)
        ?.map((e) =>
            e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ArtistMatchesToJson(ArtistMatches instance) =>
    <String, dynamic>{
      'artist': instance.artist,
    };
