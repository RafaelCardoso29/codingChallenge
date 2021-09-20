// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    results: json['results'] == null
        ? null
        : Results.fromJson(json['results'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'results': instance.results,
    };
