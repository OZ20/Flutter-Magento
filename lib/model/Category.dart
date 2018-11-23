
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createFactory: true,)
class CategoryModel extends Object with _$CategoryModelSerializerMixin{

  final int id;
  final int parentId;
  final String cName;
  final int level;
  final int position;
  final int productCount;
  final List childrenData;

  CategoryModel({this.id, this.parentId, this.cName, this.level, this.position,
    this.productCount, this.childrenData});

  factory CategoryModel.fromJson(Map<String,dynamic> json) => _$CategoryModelFromJson(json);

}