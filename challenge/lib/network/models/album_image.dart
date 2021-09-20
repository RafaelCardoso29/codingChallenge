import 'package:json_annotation/json_annotation.dart';

part 'album_image.g.dart';

@JsonSerializable()
class ContentImage {
  @JsonKey(name: "#text")
  String text;

  ContentImage({this.text});

  factory ContentImage.fromJson(Map<String, dynamic> json) =>
      _$ContentImageFromJson(json);

  Map<String, dynamic> toJson() => _$ContentImageToJson(this);
}
