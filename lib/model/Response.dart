import 'package:json_annotation/json_annotation.dart';

part 'Response.g.dart';

@JsonSerializable()
class Response extends Object {

  final int statusCode;
  final response;

  Response({this.statusCode, this.response});

  factory Response.fromJson(Map<String,dynamic> json) => _$ResponseFromJson(json);

  Map<String,dynamic> toJson() => _$ResponseToJson(this);
}