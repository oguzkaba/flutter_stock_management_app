// To parse this JSON data, do
//
//     final dummyDataModel = dummyDataModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<DummyDataModel> dummyDataModelFromJson(String str) =>
    List<DummyDataModel>.from(
        json.decode(str).map((x) => DummyDataModel.fromJson(x)));

String dummyDataModelToJson(List<DummyDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DummyDataModel {
  DummyDataModel({
    required this.siraNo,
    required this.aracNo,
    required this.malzemeninCinsi,
    required this.urunTanimi,
    required this.rafNo,
    required this.dn,
    required this.itemNo,
    required this.heatNo,
    required this.adet,
    required this.gelenAdet,
    required this.iadeAdet,
    required this.kalanAdet,
    required this.kalite,
    required this.gelisTarihi,
    required this.gelenFirma,
    required this.shipmentNumber,
    required this.sandikNo,
    required this.not,
  });

  final String siraNo;
  final String aracNo;
  final String malzemeninCinsi;
  final String urunTanimi;
  final String rafNo;
  final String dn;
  final String itemNo;
  final String heatNo;
  final String adet;
  final String gelenAdet;
  final String iadeAdet;
  final String kalanAdet;
  final String kalite;
  final String gelisTarihi;
  final GelenFirma gelenFirma;
  final String shipmentNumber;
  final String sandikNo;
  final String not;

  DummyDataModel copyWith({
    required String siraNo,
    required String aracNo,
    required String malzemeninCinsi,
    required String urunTanimi,
    required String rafNo,
    required String dn,
    required String itemNo,
    required String heatNo,
    required String adet,
    required String gelenAdet,
    required String iadeAdet,
    required String kalanAdet,
    required String kalite,
    required String gelisTarihi,
    required GelenFirma gelenFirma,
    required String shipmentNumber,
    required String sandikNo,
    required String not,
  }) =>
      DummyDataModel(
        siraNo: siraNo,
        aracNo: aracNo,
        malzemeninCinsi: malzemeninCinsi,
        urunTanimi: urunTanimi,
        rafNo: rafNo,
        dn: dn,
        itemNo: itemNo,
        heatNo: heatNo,
        adet: adet,
        gelenAdet: gelenAdet,
        iadeAdet: iadeAdet,
        kalanAdet: kalanAdet,
        kalite: kalite,
        gelisTarihi: gelisTarihi,
        gelenFirma: gelenFirma,
        shipmentNumber: shipmentNumber,
        sandikNo: sandikNo,
        not: not,
      );

  factory DummyDataModel.fromJson(Map<String, dynamic> json) => DummyDataModel(
        siraNo: json["SIRA NO"] ?? '-',
        aracNo: json["ARAÇ NO"] ?? '-',
        malzemeninCinsi: json["MALZEMENİN CİNSİ"] ?? '-',
        urunTanimi: json["ÜRÜN TANIMI"] ?? '-',
        rafNo: json["RAF NO"] ?? '-',
        dn: json["DN"] ?? '-',
        itemNo: json["ITEM NO"] ?? '-',
        heatNo: json["HEAT NO"] ?? '-',
        adet: json["ADET"] ?? '-',
        gelenAdet: json["GELEN ADET"] ?? '-',
        iadeAdet: json["İADE ADET"] ?? '-',
        kalanAdet: json["KALAN ADET"] ?? '-',
        kalite: json["KALİTE"] ?? '-',
        gelisTarihi: json["GELİŞ TARİHİ"] ?? '-',
        gelenFirma: gelenFirmaValues.map[json["GELEN FİRMA"] ?? 'ITALY']!,
        shipmentNumber: json["SHIPMENT NUMBER"] ?? '-',
        sandikNo: json["SANDIK NO"] ?? '-',
        not: json["NOT"] ?? '-',
      );

  Map<String, dynamic> toJson() => {
        "SIRA NO": siraNo,
        "ARAÇ NO": aracNo,
        "MALZEMENİN CİNSİ": malzemeninCinsi,
        "ÜRÜN TANIMI": urunTanimi,
        "RAF NO": rafNo,
        "DN": dn,
        "ITEM NO": itemNo,
        "HEAT NO": heatNo,
        "ADET": adet,
        "GELEN ADET": gelenAdet,
        "İADE ADET": iadeAdet,
        "KALAN ADET": kalanAdet,
        "KALİTE": kalite,
        "GELİŞ TARİHİ": gelisTarihi,
        "GELEN FİRMA": gelenFirmaValues.reverse[gelenFirma],
        "SHIPMENT NUMBER": shipmentNumber,
        "SANDIK NO": sandikNo,
        "NOT": not,
      };
}

enum GelenFirma {
  ITALY,
  CHINA,
  KOREA,
  S_KOREA,
  ADANA,
  INDIA,
  ADANA_ANTYE,
  EMPTY,
  SPAIN,
  TRKYE
}

final gelenFirmaValues = EnumValues({
  "ADANA ": GelenFirma.ADANA,
  "ADANA ŞANTİYE": GelenFirma.ADANA_ANTYE,
  "CHINA": GelenFirma.CHINA,
  "": GelenFirma.EMPTY,
  "INDIA": GelenFirma.INDIA,
  "ITALY": GelenFirma.ITALY,
  "KOREA": GelenFirma.KOREA,
  "SPAIN": GelenFirma.SPAIN,
  "S.KOREA": GelenFirma.S_KOREA,
  "TÜRKİYE": GelenFirma.TRKYE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
