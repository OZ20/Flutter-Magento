// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
      id: json['id'] as int,
      parentId: json['parent_id'] as int,
      cName: json['name'] as String,
      level: json['level'] as int,
      position: json['position'] as int,
      productCount: json['product_count'] as int,
      childrenData: (json['children_data'] as List)
          ?.map((e) => e == null
              ? null
              : CategoryModel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'name': instance.cName,
      'level': instance.level,
      'position': instance.position,
      'product_count': instance.productCount,
      'children_data': instance.childrenData
    };
