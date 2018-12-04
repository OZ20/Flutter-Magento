import 'package:json_annotation/json_annotation.dart';
import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/model/Customer.dart';

part 'Attributes.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class ExtensionAttributes extends Object{

  @JsonKey(name: "shipping_assignments")
  final List<ShippingAssignment> shippingAssignment;
  @JsonKey(name: "is_subscribed")
  final bool isSubscribed;

  ExtensionAttributes({this.shippingAssignment,this.isSubscribed});

  factory ExtensionAttributes.fromJson(Map<String,dynamic> json) => _$ExtensionAttributesFromJson(json);

  Map<String,dynamic> toJson() => _$ExtensionAttributesToJson(this);

}

@JsonSerializable(createFactory: true, createToJson: true)
class ShippingAssignment extends Object{

  final Shipping shipping;
  final List<Items> items;

  ShippingAssignment({this.shipping, this.items});

  factory ShippingAssignment.fromJson(Map<String,dynamic> json) => _$ShippingAssignmentFromJson(json);

  Map<String,dynamic> toJson() => _$ShippingAssignmentToJson(this);


}

@JsonSerializable(createFactory: true, createToJson: true)
class Shipping extends Object{

  final Addresses address;
  final String method;

  Shipping({this.address, this.method});

  factory Shipping.fromJson(Map<String,dynamic> json) => _$ShippingFromJson(json);

  Map<String,dynamic> toJson() => _$ShippingToJson(this);
}