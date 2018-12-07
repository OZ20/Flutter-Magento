// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtensionAttributes _$ExtensionAttributesFromJson(Map<String, dynamic> json) {
  return ExtensionAttributes(
      shippingAssignment: (json['shipping_assignments'] as List)
          ?.map((e) => e == null
              ? null
              : ShippingAssignment.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isSubscribed: json['is_subscribed'] as bool);
}

Map<String, dynamic> _$ExtensionAttributesToJson(
        ExtensionAttributes instance) =>
    <String, dynamic>{
      'shipping_assignments': instance.shippingAssignment,
      'is_subscribed': instance.isSubscribed
    };

ShippingAssignment _$ShippingAssignmentFromJson(Map<String, dynamic> json) {
  return ShippingAssignment(
      shipping: json['shipping'] == null
          ? null
          : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
      items: (json['items'] as List)
          ?.map((e) =>
              e == null ? null : Items.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ShippingAssignmentToJson(ShippingAssignment instance) =>
    <String, dynamic>{'shipping': instance.shipping, 'items': instance.items};

Shipping _$ShippingFromJson(Map<String, dynamic> json) {
  return Shipping(address: json['address'], method: json['method'] as String);
}

Map<String, dynamic> _$ShippingToJson(Shipping instance) =>
    <String, dynamic>{'address': instance.address, 'method': instance.method};
