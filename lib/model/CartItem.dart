import 'package:json_annotation/json_annotation.dart';
import 'package:magentorx/model/Attributes.dart';
import 'package:magentorx/model/Currency.dart';
import 'package:magentorx/model/Customer.dart';

part 'CartItem.g.dart';

@JsonSerializable(createFactory: true, createToJson: true )
class CartItem extends Object{

  final int id;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "is_active")
  final bool isActive;
  @JsonKey(name: "is_virtual")
  final bool isVirtual;
  final List<Items> items;
  @JsonKey(name: "items_count")
  final int itemCount;
  @JsonKey(name: "items_qty")
  final int itemQuantity;
  final Customer customer;
  @JsonKey(name: "billing_address")
  final BillingAddress billingAddress;
  @JsonKey(name: "orig_order_id")
  final int origOrderId;
  final Currency currency;
  @JsonKey(name: "customer_is_guest")
  final bool isCustomerGuest;
  @JsonKey(name: "customer_note_notify")
  final bool customerNoteNotify;
  @JsonKey(name: "customer_tax_class_id")
  final int customerTaxClassId;
  @JsonKey(name: "store_id")
  final int storeId;
  @JsonKey(name: "extension_attributes")
  final ExtensionAttributes extAttribute;

  CartItem({this.id, this.createdAt, this.updatedAt, this.isActive,
      this.isVirtual, this.items, this.itemCount, this.itemQuantity,
      this.customer, this.billingAddress, this.origOrderId, this.currency,
      this.isCustomerGuest, this.customerNoteNotify, this.customerTaxClassId,
      this.storeId, this.extAttribute});

  factory CartItem.fromJson(Map<String,dynamic> json) => _$CartItemFromJson(json);

  Map<String,dynamic> toJson() => _$CartItemToJson(this);

}

@JsonSerializable(createFactory: true, createToJson: true)
class Items extends Object{

  @JsonKey(name: "item_id")
  final int itemId;
  final String sku;
  @JsonKey(name: "qty")
  final int quantity;
  final String name;
  final int price;
  @JsonKey(name: "product_type")
  final String productType;
  @JsonKey(name: "quote_id")
  final String quoteId;

  Items({this.itemId, this.sku, this.quantity, this.name, this.price,
      this.productType, this.quoteId});

  factory Items.fromJson(Map<String,dynamic> json) => _$ItemsFromJson(json);

  Map<String,dynamic> toJson() => _$ItemsToJson(this);

}