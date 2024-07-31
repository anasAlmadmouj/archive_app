import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class SubjectTermModel {
  String? subjectTermId;
  String? subjectId;
  String? subjectNameAr;
  String? subjectNameEn;
  String? subjectNumber;
  String? departmentId;
  String? academicTermId;
  String? subjectCoordinator;



  SubjectTermModel({
    this.subjectId,
    this.subjectTermId,
    this.subjectNameAr,
    this.subjectNameEn,
    this.subjectNumber,
    this.departmentId,
    this.academicTermId,
    this.subjectCoordinator,
  });

  SubjectTermModel.fromJson(Map<String, dynamic> json) {
    subjectId = json['subjectId'];
    subjectTermId = json['subjectTermId'];
    subjectNameAr = json['subjectNameAr'];
    subjectNameEn = json['subjectNameEn'];
    subjectNumber = json['subjectNumber'];
    departmentId = json['departmentId'];
    subjectCoordinator = json['subjectCoordinator'];
    academicTermId = json['academicTermId'];
  }

  String getTitle(BuildContext context){
    if( Localizations.localeOf(context).languageCode == 'ar'){
      return subjectNameAr??"";}else{
      return subjectNameEn??"";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'subjectId': subjectId,
      'subjectTermId': subjectTermId,
      'subjectNameAr': subjectNameAr,
      'subjectNameEn': subjectNameEn,
      'subjectNumber': subjectNumber,
      'departmentId': departmentId,
      'academicTermId': academicTermId,
      'subjectCoordinator': subjectCoordinator,
    };
  }
}
