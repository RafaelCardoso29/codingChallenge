// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_matches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumMatches _$AlbumMatchesFromJson(Map<String, dynamic> json) {
  return AlbumMatches(
    album: (json['album'] as List)
        ?.map(
            (e) => e == null ? null : Album.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AlbumMatchesToJson(AlbumMatches instance) =>
    <String, dynamic>{
      'album': instance.album,
    };
