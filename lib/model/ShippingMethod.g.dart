// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShippingMethod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingMethod _$ShippingMethodFromJson(Map<String, dynamic> json) {
  return ShippingMethod(
      carrierCode: json['carrier_code'] as String,
      methodCode: json['method_code'] as String,
      carrierTitle: json['carrier_title'] as String,
      methodTitle: json['method_title'] as String,
      amount: json['amount'] as int,
      baseAmount: json['base_amount'] as int,
      available: json['available'] as bool,
      error: json['error_message'] as String,
      priceExcludingTax: json['price_excl_tax'] as int,
      priceIncludingTax: json['price_incl_tax'] as int);
}

Map<String, dynamic> _$ShippingMethodToJson(ShippingMethod instance) =>
    <String, dynamic>{
      'carrier_code': instance.carrierCode,
      'method_code': instance.methodCode,
      'carrier_title': instance.carrierTitle,
      'method_title': instance.methodTitle,
      'amount': instance.amount,
      'base_amount': instance.baseAmount,
      'available': instance.available,
      'error_message': instance.error,
      'price_excl_tax': instance.priceExcludingTax,
      'price_incl_tax': instance.priceIncludingTax
    };
