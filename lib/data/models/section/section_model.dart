import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class SectionModel {
  String? sectionId;
  String? sectionNameAr;
  String? sectionNameEn;
  String? subjectId;
  String? userId;

  SectionModel({
    this.sectionId,
    this.sectionNameAr,
    this.sectionNameEn,
    this.subjectId,
    this.userId,
  });

  SectionModel.fromJson(Map<String, dynamic> json) {
    sectionId = json['sectionId'];
    sectionNameAr = json['sectionNameAr'];
    sectionNameEn = json['sectionNameEn'];
    subjectId = json['subjectId'];
    userId = json['userId'];
  }

  String getTitle(BuildContext context){
    if( Localizations.localeOf(context).languageCode == 'ar'){
      return sectionNameAr??"";}else{
      return sectionNameEn??"";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'sectionId': sectionId,
      'sectionNameAr': sectionNameAr,
      'sectionNameEn': sectionNameEn,
      'subjectId': subjectId,
      'userId': userId,
    };
  }
}
