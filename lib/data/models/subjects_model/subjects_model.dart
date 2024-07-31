import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class SubjectsModel {
  String? subjectId;
  String? subjectNameAr;
  String? subjectNameEn;
  String? numberSubject;
  String? departmentId;


  SubjectsModel({
    this.subjectId,
    this.subjectNameAr,
    this.subjectNameEn,
    this.departmentId,
    this.numberSubject,
  });

  SubjectsModel.fromJson(Map<String, dynamic> json) {
    subjectId = json['subjectId'];
    subjectNameAr = json['subjectNameAr'];
    subjectNameEn = json['subjectNameEn'];
    departmentId = json['departmentId'];
    numberSubject = json['numberSubject'];
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
      'subjectNameAr': subjectNameAr,
      'subjectNameEn': subjectNameEn,
      'departmentId': departmentId,
      'numberSubject': numberSubject,
    };
  }
}
