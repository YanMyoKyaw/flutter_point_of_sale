import 'package:json_annotation/json_annotation.dart';
import 'shop.dart';

@JsonSerializable()
class Brand {
  int id;
  String name;
  String description;
  String createdAt;
  String updatedAt;
  String imgUrl;
  Shop shopId;
  String createdBy, updatedBy;

  Brand(
      {this.id,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.imgUrl,
      this.shopId,
      this.createdBy,
      this.updatedBy});

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
      id: json['Id'],
      name: json['Name'],
      createdBy: json['CreatedBy'],
      updatedBy: json['UpdatedBy'],
      createdAt: json['CreatedAt'],
      updatedAt: json['UpdatedAt'],
      description: json['Description'],
      imgUrl: json['ImgUrl'],
      shopId: Shop.fromJson(json['ShopId']));
  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Description': description,
        'CreatedBy': createdBy,
        'UpdatedBy': updatedBy,
        'CreatedAt': createdAt,
        'UpdatedAt': updatedAt,
        'ImgUrl': imgUrl,
        'ShopId': shopId
      };
}
