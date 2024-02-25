// ignore_for_file:  sort_constructors_first
// To parse this JSON data, do
//
//     final reportResponseModel = reportResponseModelFromJson(jsonString);

// ignore_for_file: public_member_api_docs

List<ReportModel> reportModelFromJson(List<dynamic> items) =>
    List<ReportModel>.from(
      items.map((x) => ReportModel.fromJson(x as Map<String, dynamic>)),
    );

Object reportModelToMap(ReportModel data) => data.toMap();

class ReportModel {
  ReportModel({
    required this.repNo,
    required this.repDate,
    required this.truckNo,
    required this.arrivalDate,
    required this.createdBy,
    required this.createdAt,
    required this.isActive,
    this.id,
    this.repRemarks,
    this.suppliedBy,
    this.truckDetail,
    this.prjId,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        id: int.parse(json['id'].toString()),
        repNo: json['rep_no'].toString(),
        repRemarks: json['rep_remarks'].toString(),
        repDate: json['rep_date'].toString(),
        truckNo: json['truck_no'].toString(),
        arrivalDate: json['arrival_date'].toString(),
        suppliedBy: json['supplied_by'].toString(),
        truckDetail: json['truck_detail'].toString(),
        createdBy: json['created_by'].toString(),
        createdAt: DateTime.parse(json['created_at'].toString()),
        isActive: json['is_active'] as bool,
        prjId: int.parse(json['prj_id'].toString()),
      );
  final int? id;
  final String repNo;
  final String? repRemarks;
  final String repDate;
  final String truckNo;
  final String arrivalDate;
  final String? suppliedBy;
  final String? truckDetail;
  final String createdBy;
  final DateTime createdAt;
  final bool isActive;
  final int? prjId;

  Map<String, dynamic> toMap() => {
        'rep_no': repNo,
        'rep_remarks': repRemarks,
        'rep_date': repDate,
        'truck_no': truckNo,
        'arrival_date': arrivalDate,
        'supplied_by': suppliedBy,
        'truck_detail': truckDetail,
        'created_by': createdBy,
        'created_at': createdAt.toIso8601String(),
        'is_active': isActive,
        'prj_id': prjId,
      };

  ReportModel copyWith({
    int? id,
    String? repNo,
    String? repRemarks,
    String? repDate,
    String? truckNo,
    String? arrivalDate,
    String? suppliedBy,
    String? truckDetail,
    String? createdBy,
    DateTime? createdAt,
    bool? isActive,
    int? prjId,
  }) {
    return ReportModel(
      id: id ?? this.id,
      repNo: repNo ?? this.repNo,
      repRemarks: repRemarks ?? this.repRemarks,
      repDate: repDate ?? this.repDate,
      truckNo: truckNo ?? this.truckNo,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      suppliedBy: suppliedBy ?? this.suppliedBy,
      truckDetail: truckDetail ?? this.truckDetail,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      prjId: prjId ?? this.prjId,
    );
  }
}
