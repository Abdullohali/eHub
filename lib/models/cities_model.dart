// To parse this JSON data, do
//
//     final citiyes = citiyesFromJson(jsonString);

import 'dart:convert';

List<Citiyes> citiyesFromJson(String str) =>
    List<Citiyes>.from(json.decode(str).map((x) => Citiyes.fromJson(x)));

String citiyesToJson(List<Citiyes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Citiyes {
  Citiyes({
    this.id,
    this.name,
    this.variants,
  });

  int? id;
  String? name;
  List<Variant>? variants;

  factory Citiyes.fromJson(Map<String, dynamic> json) => Citiyes(
        id: json["id"],
        name: json["name"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "variants": List<dynamic>.from(variants!.map((x) => x.toJson())),
      };
}

class Variant {
  Variant({
    this.id,
    this.name,
    this.createAt,
    this.description,
    this.icon,
  });

  int? id;
  String? name;
  DateTime? createAt;
  String? description;
  String? icon;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        name: json["name"],
        createAt: json["create_at"] == null
            ? null
            : DateTime.parse(json["create_at"]),
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "create_at": createAt == null ? null : createAt!.toIso8601String(),
        "description": description == null ? null : description,
        "icon": icon == null ? null : icon,
      };
}
