// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
      id: json['id'],
      sku: json['sku'],
      name: json['name'],
      attributeSetId: json['attribute_set_id'],
      price: json['price'],
      status: json['status'],
      visibility: json['visibility'],
      typeId: json['type_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      productLinks: json['product_links'] as List,
      tierPrices: json['tier_prices'] as List,
      customAttributes: (json['custom_attributes'] as List)
          ?.map((e) => e == null
              ? null
              : CustomAttributes.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'attribute_set_id': instance.attributeSetId,
      'price': instance.price,
      'status': instance.status,
      'visibility': instance.visibility,
      'type_id': instance.typeId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'product_links': instance.productLinks,
      'tier_prices': instance.tierPrices,
      'custom_attributes': instance.customAttributes
    };

CustomAttributes _$CustomAttributesFromJson(Map<String, dynamic> json) {
  return CustomAttributes(
      attributeCode: json['attribute_code'], value: json['value']);
}

Map<String, dynamic> _$CustomAttributesToJson(CustomAttributes instance) =>
    <String, dynamic>{
      'attribute_code': instance.attributeCode,
      'value': instance.value
    };
