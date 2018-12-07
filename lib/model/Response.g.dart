// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
      statusCode: json['statusCode'] as int, response: json['response']);
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'response': instance.response
    };
