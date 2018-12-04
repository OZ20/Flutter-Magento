import 'package:json_annotation/json_annotation.dart';

part 'Currency.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class Currency extends Object {

  @JsonKey(name: "global_currency_code")
  final String globalCurrencyCode;
  @JsonKey(name: "base_currency_code")
  final String baseCurrencyCode;
  @JsonKey(name: "store_currency_code")
  final String storeCurrencyCode;
  @JsonKey(name: "quote_currency_code")
  final String quoteCurrencyCode;
  @JsonKey(name: "store_to_base_rate")
  final int storeToBaseRate;
  @JsonKey(name: "store_to_quote_rate")
  final int storeToQuoteRate;
  @JsonKey(name: "base_to_global_rate")
  final int baseToGlobalRate;
  @JsonKey(name: "base_to_quote_rate")
  final int baseToQuoteRate;

  Currency({this.globalCurrencyCode, this.baseCurrencyCode,
      this.storeCurrencyCode, this.quoteCurrencyCode, this.storeToBaseRate,
      this.storeToQuoteRate, this.baseToGlobalRate, this.baseToQuoteRate});

  factory Currency.fromJson(Map<String,dynamic> json) => _$CurrencyFromJson(json);

  Map<String,dynamic> toJson() => _$CurrencyToJson(this);
}
