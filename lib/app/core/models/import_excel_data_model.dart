// To parse this JSON data, do
//
//     final ImportDataModel = ImportDataModelFromJson(jsonString);

// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:flutter_stock_management_app/app/core/models/supabase_models/material_model.dart';
import 'package:flutter_stock_management_app/app/core/utils/utils.dart';

List<ImportDataModel> importDataModelFromJson(List<dynamic> items) =>
    List<ImportDataModel>.from(
      items.map((x) => ImportDataModel.fromJson(x as Map<String, dynamic>)),
    );

String importDataModelToJson(List<ImportDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<MaterialsModel> importDataModelToMaterialsModel(
  List<ImportDataModel> data,
) =>
    List<MaterialsModel>.from(
      data.map((x) => x.toMaterialsModel()).expand((element) => element),
    );

class ImportDataModel {
  ImportDataModel({
    this.siraNo,
    this.aracNo,
    this.malzemeninCinsi,
    this.urunTanimi,
    this.rafNo,
    this.dn,
    this.itemNo,
    this.heatNo,
    this.adet,
    this.gelenAdet,
    this.imalataVerilenAdet,
    this.santiyeSevkAdet,
    this.kalanAdet,
    this.gelisTarihi,
    this.gelenFirma,
    this.shipmentNumber,
    this.sandikNo,
    this.karantina,
    this.not,
  });

  factory ImportDataModel.fromJson(Map<String, dynamic> json) =>
      ImportDataModel(
        siraNo: json['SIRA NO'] == null
            ? null
            : int.parse(json['SIRA NO'].toString()),
        aracNo: json['ARAÇ NO']?.toString(),
        malzemeninCinsi: json['MALZEMENİN CİNSİ']?.toString(),
        urunTanimi: json['ÜRÜN TANIMI']?.toString(),
        rafNo: json['RAF NO']?.toString(),
        dn: json['DN']?.toString(),
        itemNo: json['ITEM NO']?.toString(),
        heatNo: json['HEAT NO']?.toString(),
        adet: json['ADET'] == null ? null : int.parse(json['ADET'].toString()),
        gelenAdet: json['GELEN ADET'] == null
            ? null
            : int.parse(json['GELEN ADET'].toString()),
        imalataVerilenAdet: json['İMALATA VERİLEN ADET'] == null
            ? null
            : int.parse(json['İADE ADET'].toString()),
        santiyeSevkAdet: json['SANTİYE SEVK ADET'] == null
            ? null
            : int.parse(json['SANTİYE SEVK ADET'].toString()),
        kalanAdet: json['KALAN ADET'] == null
            ? null
            : int.parse(json['KALAN ADET'].toString()),
        gelisTarihi: json['GELİŞ TARİHİ'] == null
            ? null
            : Utils.dateFormatDDMMYYYY(
                DateTime.parse(json['GELİŞ TARİHİ'].toString()),
              ),
        gelenFirma: json['GELEN FİRMA']?.toString(),
        shipmentNumber: json['SHIPMENT NUMBER']?.toString(),
        sandikNo: json['SANDIK NO']?.toString(),
        karantina: json['KARANTİNA'] == null
            ? null
            : int.parse(json['SANTİYE SEVK ADET'].toString()),
        not: json['AÇIKLAMA']?.toString(),
      );
  final int? siraNo;
  final String? aracNo;
  final String? malzemeninCinsi;
  final String? urunTanimi;
  final String? rafNo;
  final String? dn;
  final String? itemNo;
  final String? heatNo;
  final int? adet;
  final int? gelenAdet;
  final int? imalataVerilenAdet;
  final int? santiyeSevkAdet;
  final int? kalanAdet;
  final String? gelisTarihi;
  final String? gelenFirma;
  final String? shipmentNumber;
  final String? sandikNo;
  final int? karantina;
  final String? not;

  List<MaterialsModel> toMaterialsModel() => [
        MaterialsModel(
          seqNo: siraNo,
          truckNo: aracNo,
          matType: malzemeninCinsi,
          description: urunTanimi,
          shelfNo: rafNo,
          diameter: dn,
          itemNo: itemNo,
          heatNo: heatNo,
          recQty: adet,
          inQty: gelenAdet,
          manQty: imalataVerilenAdet,
          consQty: santiyeSevkAdet,
          remQty: kalanAdet,
          arrivalDate: gelisTarihi,
          inCompany: gelenFirma,
          shippNo: shipmentNumber,
          boxNo: sandikNo,
          quarantine: karantina,
          note: not,
        ),
      ];

  Map<String, dynamic> toJson() => {
        'SIRA NO': siraNo,
        'ARAC NO': aracNo,
        'MALZEMENIN CINSI': malzemeninCinsi,
        'URUN TANIMI': urunTanimi,
        'RAF NO': rafNo,
        'DN': dn,
        'ITEM NO': itemNo,
        'HEAT NO': heatNo,
        'İRSALİYE ADET': adet,
        'GELEN ADET': gelenAdet,
        'İMALATA VERİLEN ADET': imalataVerilenAdet,
        'SANTİYE SEVK ADET': santiyeSevkAdet,
        'KALAN ADET': kalanAdet,
        'GELIS TARIHI': gelisTarihi,
        'GELEN FIRMA': gelenFirma,
        'SHIPMENT NUMBER': shipmentNumber,
        'SANDIK NO': sandikNo,
        'KARANTİNA': karantina,
        'NOT': not,
      };
}
