// To parse this JSON data, do
//
//     final materialTypeModel = materialTypeModelFromJson(jsonString);

// ignore_for_file: public_member_api_docs

import 'dart:convert';

List<MaterialTypeModel> materialTypeModelFromJson(String str) {
  final items = json.decode(str) as List<dynamic>;

  return List<MaterialTypeModel>.from(
    items.map((e) => MaterialTypeModel.fromJson(e as Map<String, dynamic>)),
  );
}

class MaterialTypeModel {
  MaterialTypeModel({
    required this.id,
    required this.name,
  });

  factory MaterialTypeModel.fromJson(Map<String, dynamic> json) =>
      MaterialTypeModel(
        id: json['id'] as String,
        name: json['name'] as String,
      );
  String id;
  String name;
}
