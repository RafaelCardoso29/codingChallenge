import 'package:challenge/network/models/results.dart';

import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  Results results;

  Response({this.results});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
