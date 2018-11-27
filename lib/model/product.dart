
import 'package:json_annotation/json_annotation.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product extends Object{

  final id;
  final sku;
  final name;
  @JsonKey(name: "attribute_set_id")
  final attributeSetId;
  final price;
  final status;
  final visibility;
  @JsonKey(name:"type_id")
  final typeId;
  @JsonKey(name:"created_at")
  final createdAt;
  @JsonKey(name:"updated_at")
  final updatedAt;
  @JsonKey(name: "product_links")
  final List productLinks;
  @JsonKey(name: "tier_prices")
  final List tierPrices;
  @JsonKey(name:"custom_attributes")
  final List<CustomAttributes> customAttributes;

  Product({this.id, this.sku, this.name, this.attributeSetId, this.price,
      this.status, this.visibility, this.typeId, this.createdAt, this.updatedAt,
      this.productLinks, this.tierPrices, this.customAttributes});

  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);

  Map<String,dynamic> toJson() => _$ProductToJson(this);

}

@JsonSerializable()
class CustomAttributes extends Object{

  @JsonKey(name:"attribute_code")
  final  attributeCode;
  final  value;

  CustomAttributes({this.attributeCode, this.value});

  factory CustomAttributes.fromJson(Map<String,dynamic> json) => _$CustomAttributesFromJson(json);

  Map<String,dynamic> toJson() => _$CustomAttributesToJson(this);

}