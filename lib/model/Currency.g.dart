// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return Currency(
      globalCurrencyCode: json['global_currency_code'] as String,
      baseCurrencyCode: json['base_currency_code'] as String,
      storeCurrencyCode: json['store_currency_code'] as String,
      quoteCurrencyCode: json['quote_currency_code'] as String,
      storeToBaseRate: json['store_to_base_rate'] as int,
      storeToQuoteRate: json['store_to_quote_rate'] as int,
      baseToGlobalRate: json['base_to_global_rate'] as int,
      baseToQuoteRate: json['base_to_quote_rate'] as int);
}

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'global_currency_code': instance.globalCurrencyCode,
      'base_currency_code': instance.baseCurrencyCode,
      'store_currency_code': instance.storeCurrencyCode,
      'quote_currency_code': instance.quoteCurrencyCode,
      'store_to_base_rate': instance.storeToBaseRate,
      'store_to_quote_rate': instance.storeToQuoteRate,
      'base_to_global_rate': instance.baseToGlobalRate,
      'base_to_quote_rate': instance.baseToQuoteRate
    };
