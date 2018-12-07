import 'package:json_annotation/json_annotation.dart';

part 'ShippingMethod.g.dart';

@JsonSerializable()
class ShippingMethod extends Object {

  @JsonKey(name: "carrier_code")
  final String carrierCode;
  @JsonKey(name: "method_code")
  final String methodCode;
  @JsonKey(name: "carrier_title")
  final String carrierTitle;
  @JsonKey(name: "method_title")
  final String methodTitle;
  final int amount;
  @JsonKey(name: "base_amount")
  final int baseAmount;
  final bool available;
  @JsonKey(name: "error_message")
  final String error;
  @JsonKey(name: "price_excl_tax")
  final int priceExcludingTax;
  @JsonKey(name: "price_incl_tax")
  final int priceIncludingTax;

  ShippingMethod({this.carrierCode, this.methodCode, this.carrierTitle,
      this.methodTitle, this.amount, this.baseAmount, this.available,
      this.error, this.priceExcludingTax, this.priceIncludingTax});

  factory ShippingMethod.fromJson(Map<String,dynamic>json ) => _$ShippingMethodFromJson(json);

  Map<String,dynamic> toJson() => _$ShippingMethodToJson(this);

}

