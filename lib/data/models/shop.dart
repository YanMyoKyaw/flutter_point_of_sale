import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Shop {
  int id;
  String createdBy, updatedBy;
  String createdAt;
  String updatedAt;
  String name;
  String description;
  String owner;

  Shop({
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.description,
    this.name,
    this.owner,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json['Id'],
        createdAt: json['CreatedAt'],
        createdBy: json['CreatedBy'],
        updatedAt: json['UpdatedAt'],
        updatedBy: json['UpdatedBy'],
        name: json['Name'],
        description: json['Description'],
        owner: json['Owner'],
      );
  Map<String, dynamic> toJson() =>
      {'Name': name, 'Description': description, 'Owner': owner};
}
