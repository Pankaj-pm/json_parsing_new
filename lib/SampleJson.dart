import 'dart:convert';

class SampleJson {
  String? firstName;
  String? lastName;
  String? gender;
  int? age;
  Address? address;
  List<PhoneNumber>? phoneNumbers;

  SampleJson({
    this.firstName,
    this.lastName,
    this.gender,
    this.age,
    this.address,
    this.phoneNumbers,
  });

  factory SampleJson.fromRawJson(String str) => SampleJson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SampleJson.fromJson(Map<String, dynamic> json) => SampleJson(
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    age: json["age"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    phoneNumbers: json["phoneNumbers"] == null ? [] : List<PhoneNumber>.from(json["phoneNumbers"]!.map((x) => PhoneNumber.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "age": age,
    "address": address?.toJson(),
    "phoneNumbers": phoneNumbers == null ? [] : List<dynamic>.from(phoneNumbers!.map((x) => x.toJson())),
  };
}

class Address {
  String? streetAddress;
  String? city;
  String? state;
  String? postalCode;

  Address({
    this.streetAddress,
    this.city,
    this.state,
    this.postalCode,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    streetAddress: json["streetAddress"],
    city: json["city"],
    state: json["state"],
    postalCode: json["postalCode"],
  );

  Map<String, dynamic> toJson() => {
    "streetAddress": streetAddress,
    "city": city,
    "state": state,
    "postalCode": postalCode,
  };
}

class PhoneNumber {
  String? type;
  String? number;

  PhoneNumber({
    this.type,
    this.number,
  });

  factory PhoneNumber.fromRawJson(String str) => PhoneNumber.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => PhoneNumber(
    type: json["type"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "number": number,
  };
}
