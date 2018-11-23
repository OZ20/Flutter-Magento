
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable
class CategoryModel extends Object with _$SCategoryModeltSerializerMixin{

  final id;
  final parentId;
  final cName;
  final level;
  final position;
  final productCount;
  final childrenData;

  CategoryModel({this.id, this.parentId, this.cName, this.level, this.position,
    this.productCount, this.childrenData});

  factory CategoryModel.fromJson(Map<String,dynamic> json) => _$SimpleObjectFromJson(json);

}