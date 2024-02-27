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
    this.recQty,
    this.inQty,
    this.manQty,
    this.consQty,
    this.remQty,
    this.arrivalDate,
    this.inCompany,
    this.shippNo,
    this.boxNo,
    this.quarantine,
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
        recQty: json['rec_qty'] as int?,
        inQty: json['in_qty'] as int?,
        manQty: json['man_qty'] as int?,
        consQty: json['cons_qty'] as int?,
        remQty: json['rem_qty'] as int?,
        arrivalDate: json['arrival_date'] as String?,
        inCompany: json['in_company'] as String?,
        shippNo: json['shipp_no'] as String?,
        boxNo: json['box_no'] as String?,
        note: json['note'] as String?,
        createdBy: json['created_by'] as String?,
        quarantine: json['quarantine'] as int?,
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
  final int? recQty;
  final int? inQty;
  final int? manQty;
  final int? consQty;
  final int? remQty;
  final String? arrivalDate;
  final String? inCompany;
  final String? shippNo;
  final String? boxNo;
  final int? quarantine;
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
        'rec_qty': recQty,
        'in_qty': inQty,
        'man_qty': manQty,
        'cons_qty': consQty,
        'rem_qty': remQty,
        'arrival_date': arrivalDate,
        'in_company': inCompany,
        'shipp_no': shippNo,
        'box_no': boxNo,
        'quarantine': quarantine,
        'note': note,
        'created_by': createdBy,
        'is_active': isActive,
      };
}
