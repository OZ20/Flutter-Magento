import 'package:json_annotation/json_annotation.dart';
import 'package:magentorx/model/Attributes.dart';

part 'Customer.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class Customer extends Object{

  final int id;
  @JsonKey(name: "group_id")
  final int groupId;
  @JsonKey(name: "default_billing")
  final String defaultBilling;
  @JsonKey(name: "default_shipping")
  final String defaultShipping;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "created_in")
  final String createdIn;
  final String dob;
  final String email;
  @JsonKey(name: "firstname")
  final String fName;
  @JsonKey(name: "lastname")
  final String lName;
  final String prefix;
  final int gender;
  @JsonKey(name: "store_id")
  final int storeId;
  @JsonKey(name: "website_id")
  final int websiteId;
  @JsonKey(name: "addresses")
  final List<Addresses> addresses;
  @JsonKey(name: "disable_auto_group_change")
  final int disAutoGroupChange;
  @JsonKey(name: "extension_attributes")
  final ExtensionAttributes extAttributes;


  Customer({this.id, this.groupId, this.defaultBilling, this.defaultShipping,
      this.createdAt, this.updatedAt, this.createdIn, this.dob, this.email,
      this.fName, this.lName, this.prefix, this.gender, this.storeId,
      this.websiteId, this.addresses, this.disAutoGroupChange,
      this.extAttributes});

  factory Customer.fromJson(Map<String,dynamic> json) => _$CustomerFromJson(json);

  Map<String,dynamic> toJson() => _$CustomerToJson(this);

}

@JsonSerializable(createFactory: true, createToJson: true)
class Addresses extends Object{

  final int id;
  @JsonKey(name: "customer_id")
  final int customerId;
  final Region region;
  @JsonKey(name: "region_id")
  final int regionId;
  @JsonKey(name: "country_id")
  final String countryId;
  final List<String> street;
  final String company;
  final String telephone;
  final String postcode;
  final String city;
  @JsonKey(name: "firstname")
  final String fName;
  @JsonKey(name: "lastname")
  final String lName;
  final String prefix;
  final String email;
  @JsonKey(name: "default_shipping")
  final bool defaultShipping;
  @JsonKey(name: "default_billing")
  final bool defaultBilling;

  Addresses({this.id, this.customerId, this.region, this.regionId,
      this.countryId, this.street, this.company, this.telephone, this.postcode,
      this.city, this.fName, this.lName, this.prefix, this.email,
      this.defaultShipping, this.defaultBilling});

  factory Addresses.fromJson(Map<String,dynamic> json) => _$AddressesFromJson(json);

  Map<String,dynamic> toJson() => _$AddressesToJson(this);
}

@JsonSerializable(createFactory: true, createToJson: true)
class BillingAddress extends Object {

  final int id;
  final String region;
  @JsonKey(name: "region_id")
  final int regionId;
  @JsonKey(name: "region_code")
  final String regionCode;
  @JsonKey(name: "country_id")
  final String countryId;
  final List<String> street;
  final String telephone;
  final String postcode;
  final String city;
  @JsonKey(name: "firstname")
  final String fName;
  @JsonKey(name: "lastname")
  final String lName;
  @JsonKey(name: "customer_id")
  final int customerId;
  final String email;
  @JsonKey(name: "same_as_billing")
  final int sameAsBilling;
  @JsonKey(name: "save_in_address_book")
  final int saveInAddressBook;

  BillingAddress({this.id, this.region, this.regionId, this.regionCode,
      this.countryId, this.street, this.telephone, this.postcode, this.city,
      this.fName, this.lName, this.customerId, this.email, this.sameAsBilling,
      this.saveInAddressBook});

  factory BillingAddress.fromJson(Map<String,dynamic> json) => _$BillingAddressFromJson(json);

  Map<String,dynamic> toJson() => _$BillingAddressToJson(this);

}

@JsonSerializable(createFactory: true, createToJson: true)
class Region extends Object{

  @JsonKey(name: "region_code")
  final regionCode;
  @JsonKey(name: "region")
  final region;
  @JsonKey(name: "region_id")
  final regionId;

  Region({this.regionCode, this.region, this.regionId});

  factory Region.fromJson(Map<String,dynamic> json) => _$RegionFromJson(json);

  Map<String,dynamic> toJson() => _$RegionToJson(this);
}



