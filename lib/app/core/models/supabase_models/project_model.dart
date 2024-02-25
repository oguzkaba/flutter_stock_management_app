// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

// ignore_for_file: public_member_api_docs

List<ProjectModel> projectModelFromJson(List<dynamic> items) {
  return List<ProjectModel>.from(
    items.map((x) => ProjectModel.fromJson(x as Map<String, dynamic>)),
  );
}

Object projectModelToMap(ProjectModel data) => data.toMap();

class ProjectModel {
  ProjectModel({
    required this.prjNo,
    required this.prjName,
    required this.createdBy,
    required this.isActive,
    this.id,
    this.prjDetails,
    this.createdAt,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: int.parse(json['id'].toString()),
        prjNo: json['prj_no'].toString(),
        prjName: json['prj_name'].toString(),
        prjDetails: json['prj_details'].toString(),
        createdAt: DateTime.parse(json['created_at'].toString()),
        createdBy: json['created_by'].toString(),
        isActive: json['is_active'] as bool,
      );
  final int? id;
  final String prjNo;
  final String prjName;
  final String? prjDetails;
  final DateTime? createdAt;
  final String createdBy;
  final bool isActive;

  Map<String, dynamic> toMap() => {
        'id': id,
        'prj_no': prjNo,
        'prj_name': prjName,
        'prj_details': prjDetails,
        'created_at': createdAt?.toIso8601String(),
        'created_by': createdBy,
        'is_active': isActive,
      };
}
