
import 'package:json_annotation/json_annotation.dart';

part 'Category.g.dart';


@JsonSerializable()
class CategoryModel extends Object {

  final int id;
  @JsonKey(name: "parent_id")
  final int parentId;
  @JsonKey(name: "name")
  final String cName;
  final int level;
  final int position;
  @JsonKey(name: "product_count")
  final int productCount;
  @JsonKey(name: "children_data")
  final List<CategoryModel> childrenData;

  CategoryModel({this.id, this.parentId, this.cName, this.level, this.position,
    this.productCount, this.childrenData});

  factory CategoryModel.fromJson(Map<String,dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

}