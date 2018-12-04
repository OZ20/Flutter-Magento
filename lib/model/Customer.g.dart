// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
      id: json['id'] as int,
      groupId: json['group_id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      email: json['created_in'] as String,
      fName: json['firstname'] as String,
      lName: json['lastname'] as String,
      storeId: json['store_id'] as int,
      websiteId: json['website_id'] as int,
      address: (json['addresses'] as List)
          ?.map((e) =>
              e == null ? null : Addresses.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      disAutoGroupChange: json['disable_auto_group_change'] as int,
      extAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttributes.fromJson(
              json['extension_attributes'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_in': instance.email,
      'firstname': instance.fName,
      'lastname': instance.lName,
      'store_id': instance.storeId,
      'website_id': instance.websiteId,
      'addresses': instance.address,
      'disable_auto_group_change': instance.disAutoGroupChange,
      'extension_attributes': instance.extAttributes
    };

Addresses _$AddressesFromJson(Map<String, dynamic> json) {
  return Addresses(
      id: json['id'] as int,
      customerId: json['customer_id'] as int,
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      regionId: json['region_id'] as int,
      countryId: json['country_id'] as String,
      street: (json['street'] as List)?.map((e) => e as String)?.toList(),
      company: json['company'] as String,
      telephone: json['telephone'] as String,
      postcode: json['postcode'] as String,
      city: json['city'] as String,
      fName: json['firstname'] as String,
      lName: json['lastname'] as String,
      prefix: json['prefix'] as String,
      email: json['email'] as String,
      defaultShipping: json['default_shipping'] as bool,
      defaultBilling: json['default_billing'] as bool);
}

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'region': instance.region,
      'region_id': instance.regionId,
      'country_id': instance.countryId,
      'street': instance.street,
      'company': instance.company,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.fName,
      'lastname': instance.lName,
      'prefix': instance.prefix,
      'email': instance.email,
      'default_shipping': instance.defaultShipping,
      'default_billing': instance.defaultBilling
    };

BillingAddress _$BillingAddressFromJson(Map<String, dynamic> json) {
  return BillingAddress(
      id: json['id'] as int,
      region: json['region'] as String,
      regionId: json['region_id'] as int,
      regionCode: json['region_code'] as String,
      countryId: json['country_id'] as String,
      street: (json['street'] as List)?.map((e) => e as String)?.toList(),
      telephone: json['telephone'] as String,
      postcode: json['postcode'] as String,
      city: json['city'] as String,
      fName: json['firstname'] as String,
      lName: json['lastname'] as String,
      customerId: json['customer_id'] as int,
      email: json['email'] as String,
      sameAsBilling: json['same_as_billing'] as int,
      saveInAddressBook: json['save_in_address_book'] as int);
}

Map<String, dynamic> _$BillingAddressToJson(BillingAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'region_id': instance.regionId,
      'region_code': instance.regionCode,
      'country_id': instance.countryId,
      'street': instance.street,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.fName,
      'lastname': instance.lName,
      'customer_id': instance.customerId,
      'email': instance.email,
      'same_as_billing': instance.sameAsBilling,
      'save_in_address_book': instance.saveInAddressBook
    };

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
      regionCode: json['region_code'],
      region: json['region'],
      regionId: json['region_id']);
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'region_code': instance.regionCode,
      'region': instance.region,
      'region_id': instance.regionId
    };
