// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) {
  return ProductDetail(
      image: json['image'],
      urlKey: json['url_key'],
      giftMessageAvailable: json['gift_message_available'],
      actualPrice: json['msrp_display_actual_price_type'],
      requiredOption: json['required_options'],
      hasOptions: json['has_options'],
      taxClassId: json['tax_class_id'],
      quantity: json['quantity_and_stock_status'],
      categoryId: json['category_ids'] as List,
      description: json['description']);
}

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'image': instance.image,
      'url_key': instance.urlKey,
      'gift_message_available': instance.giftMessageAvailable,
      'msrp_display_actual_price_type': instance.actualPrice,
      'required_options': instance.requiredOption,
      'has_options': instance.hasOptions,
      'tax_class_id': instance.taxClassId,
      'quantity_and_stock_status': instance.quantity,
      'category_ids': instance.categoryId,
      'description': instance.description
    };
