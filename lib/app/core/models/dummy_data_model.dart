// To parse this JSON data, do
//
//     final dummyDataModel = dummyDataModelFromJson(jsonString);

// ignore_for_file: public_member_api_docs

import 'dart:convert';

//json.decode(str).map((x)=>DummyDataModel.fromJson(x))

List<DummyDataModel> dummyDataModelFromJson(String str) {
  final items = json.decode(str) as List<dynamic>;

  return List<DummyDataModel>.from(
    items.map((e) => DummyDataModel.fromJson(e as Map<String, dynamic>)),
  );
}

class DummyDataModel {
  DummyDataModel({
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
    this.iadeAdet,
    this.kalanAdet,
    this.kalite,
    this.gelisTarihi,
    this.gelenFirma,
    this.shipmentNumber,
    this.sandikNo,
    this.not,
  });

  factory DummyDataModel.fromJson(Map<String, dynamic> json) => DummyDataModel(
        siraNo: json['SIRA NO'] as String?,
        aracNo: json['ARAÇ NO'] as String?,
        malzemeninCinsi: json['MALZEMENİN CİNSİ'] as String?,
        urunTanimi: json['ÜRÜN TANIMI'] as String?,
        rafNo: json['RAF NO'] as String?,
        dn: json['DN'] as String?,
        itemNo: json['ITEM NO'] as String?,
        heatNo: json['HEAT NO'] as String?,
        adet: json['ADET'] as String?,
        gelenAdet: json['GELEN ADET'] as String?,
        iadeAdet: json['İADE ADET'] as String?,
        kalanAdet: json['KALAN ADET'] as String?,
        kalite: json['KALİTE'] as String?,
        gelisTarihi: json['GELİŞ TARİHİ'] as String?,
        gelenFirma: json['GELEN FİRMA'] as String?,
        shipmentNumber: json['SHIPMENT NUMBER'] as String?,
        sandikNo: json['SANDIK NO'] as String?,
        not: json['NOT'] as String?,
      );
  final String? siraNo;
  final String? aracNo;
  final String? malzemeninCinsi;
  final String? urunTanimi;
  final String? rafNo;
  final String? dn;
  final String? itemNo;
  final String? heatNo;
  final String? adet;
  final String? gelenAdet;
  final String? iadeAdet;
  final String? kalanAdet;
  final String? kalite;
  final String? gelisTarihi;
  final String? gelenFirma;
  final String? shipmentNumber;
  final String? sandikNo;
  final String? not;
}
