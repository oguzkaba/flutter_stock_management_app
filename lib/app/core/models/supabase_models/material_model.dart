// To parse this JSON data, do
//
//     final materialsModel = materialsModelFromJson(jsonString);

// ignore_for_file: public_member_api_docs

import 'dart:convert';

List<MaterialsModel> materialsModelFromJson(List<dynamic> items) =>
    List<MaterialsModel>.from(
      items.map((x) => MaterialsModel.fromJson(x as Map<String, dynamic>)),
    );

String materialsModelToJson(List<MaterialsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MaterialsModel {
  MaterialsModel({
    this.id,
    this.createdAt,
    this.seqNo,
    this.truckNo,
    this.matType,
    this.description,
    this.shelfNo,
    this.diameter,
    this.itemNo,
    this.heatNo,
    this.quantity,
    this.inQty,
    this.retQty,
    this.remQty,
    this.quality,
    this.arrivalDate,
    this.inCompany,
    this.shippNo,
    this.boxNo,
    this.note,
    this.createdBy,
    this.isActive,
  });

  factory MaterialsModel.fromJson(Map<String, dynamic> json) => MaterialsModel(
        id: json['id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'].toString()),
        seqNo: json['seq_no'] as int?,
        truckNo: json['truck_no'] as String?,
        matType: json['mat_type'] as String?,
        description: json['description'] as String?,
        shelfNo: json['shelf_no'] as String?,
        diameter: json['diameter'] as String?,
        itemNo: json['item_no'] as String?,
        heatNo: json['heat_no'] as String?,
        quantity: json['quantity'] as int?,
        inQty: json['in_qty'] as int?,
        retQty: json['ret_qty'] as int?,
        remQty: json['rem_qty'] as int?,
        quality: json['quality'] as String?,
        arrivalDate: json['arrival_date'] as String?,
        inCompany: json['in_company'] as String?,
        shippNo: json['shipp_no'] as String?,
        boxNo: json['box_no'] as String?,
        note: json['note'] as String?,
        createdBy: json['created_by'] as String?,
        isActive: json['is_active'] as bool?,
      );
  final int? id;
  final DateTime? createdAt;
  final int? seqNo;
  final String? truckNo;
  final String? matType;
  final String? description;
  final String? shelfNo;
  final String? diameter;
  final String? itemNo;
  final String? heatNo;
  final int? quantity;
  final int? inQty;
  final int? retQty;
  final int? remQty;
  final String? quality;
  final String? arrivalDate;
  final String? inCompany;
  final String? shippNo;
  final String? boxNo;
  final String? note;
  final String? createdBy;
  final bool? isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'seq_no': seqNo,
        'truck_no': truckNo,
        'mat_type': matType,
        'description': description,
        'shelf_no': shelfNo,
        'diameter': diameter,
        'item_no': itemNo,
        'heat_no': heatNo,
        'quantity': quantity,
        'in_qty': inQty,
        'ret_qty': retQty,
        'rem_qty': remQty,
        'quality': quality,
        'arrival_date': arrivalDate,
        'in_company': inCompany,
        'shipp_no': shippNo,
        'box_no': boxNo,
        'note': note,
        'created_by': createdBy,
        'is_active': isActive,
      };
}
