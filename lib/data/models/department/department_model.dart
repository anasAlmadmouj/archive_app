import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class DepartmentModel {
  String? departmentNameAr;
  String? departmentNameEn;
  String? departmentId;
  String? departmentHeadId;


  DepartmentModel({
    this.departmentNameAr,
    this.departmentNameEn,
    this.departmentId,
    this.departmentHeadId,

  });

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    departmentNameAr = json['departmentNameAr'];
    departmentNameEn = json['departmentNameEn'];
    departmentId = json['departmentId'];
    departmentHeadId = json['departmentHeadId'];
  }

  String getTitle(BuildContext context){
    if( Localizations.localeOf(context).languageCode == 'ar'){
      return departmentNameAr??"";}else{
      return departmentNameEn??"";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'departmentNameAr': departmentNameAr,
      'departmentNameEn': departmentNameEn,
      'departmentId': departmentId,
      'departmentHeadId': departmentHeadId,
    };
  }
}
