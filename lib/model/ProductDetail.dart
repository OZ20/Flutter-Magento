
import 'package:json_annotation/json_annotation.dart';

part 'ProductDetail.g.dart';

@JsonSerializable()
class ProductDetail {

  final image;
  @JsonKey(name: "url_key")
  final urlKey;
  @JsonKey(name: "gift_message_available")
  final giftMessageAvailable;
  @JsonKey(name: "msrp_display_actual_price_type")
  final actualPrice;
  @JsonKey(name: "required_options")
  final requiredOption;
  @JsonKey(name: "has_options")
  final hasOptions;
  @JsonKey(name: "tax_class_id")
  final taxClassId;
  @JsonKey(name: "quantity_and_stock_status")
  final quantity;
  @JsonKey(name: "category_ids")
  final List categoryId;
  final description;

  ProductDetail({this.image, this.urlKey, this.giftMessageAvailable,
      this.actualPrice, this.requiredOption, this.hasOptions, this.taxClassId,
      this.quantity, this.categoryId, this.description});

  factory ProductDetail.fromMap(Map<String,dynamic> json) => _$ProductDetailFromJson(json);

  Map<String,dynamic> toJson() => _$ProductDetailToJson(this);
}