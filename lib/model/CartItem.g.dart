// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      isActive: json['is_active'] as bool,
      isVirtual: json['is_virtual'] as bool,
      items: (json['items'] as List)
          ?.map((e) =>
              e == null ? null : Items.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      itemCount: json['items_count'] as int,
      itemQuantity: json['items_qty'] as int,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      billingAddress: json['billing_address'] == null
          ? null
          : BillingAddress.fromJson(
              json['billing_address'] as Map<String, dynamic>),
      origOrderId: json['orig_order_id'] as int,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      isCustomerGuest: json['customer_is_guest'] as bool,
      customerNoteNotify: json['customer_note_notify'] as bool,
      customerTaxClassId: json['customer_tax_class_id'] as int,
      storeId: json['store_id'] as int,
      extAttribute: json['extension_attributes'] == null
          ? null
          : ExtensionAttributes.fromJson(
              json['extension_attributes'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_active': instance.isActive,
      'is_virtual': instance.isVirtual,
      'items': instance.items,
      'items_count': instance.itemCount,
      'items_qty': instance.itemQuantity,
      'customer': instance.customer,
      'billing_address': instance.billingAddress,
      'orig_order_id': instance.origOrderId,
      'currency': instance.currency,
      'customer_is_guest': instance.isCustomerGuest,
      'customer_note_notify': instance.customerNoteNotify,
      'customer_tax_class_id': instance.customerTaxClassId,
      'store_id': instance.storeId,
      'extension_attributes': instance.extAttribute
    };

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
      itemId: json['item_id'] as int,
      sku: json['sku'] as String,
      quantity: json['qty'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      productType: json['product_type'] as String,
      quoteId: json['quote_id'] as String);
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'sku': instance.sku,
      'qty': instance.quantity,
      'name': instance.name,
      'price': instance.price,
      'product_type': instance.productType,
      'quote_id': instance.quoteId
    };
