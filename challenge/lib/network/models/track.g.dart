// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) {
  return Track(
    name: json['name'] as String,
    artist: json['artist'] as String,
    url: json['url'] as String,
    listeners: json['listeners'] as String,
    image: (json['image'] as List)
        ?.map((e) =>
            e == null ? null : ContentImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mbid: json['mbid'] as String,
  );
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'name': instance.name,
      'artist': instance.artist,
      'url': instance.url,
      'listeners': instance.listeners,
      'mbid': instance.mbid,
      'image': instance.image,
    };
