import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AcademicTermsModel {
  String? academicTermsId;
  String? academicTermsNameAr;
  String? academicTermsNameEn;
  String? academicYearsId;


  AcademicTermsModel({
    this.academicTermsId,
    this.academicTermsNameAr,
    this.academicTermsNameEn,
    this.academicYearsId,
  });

  AcademicTermsModel.fromJson(Map<String, dynamic> json) {
    academicTermsId = json['academicTermsId'];
    academicTermsNameAr = json['academicTermsNameAr'];
    academicTermsNameEn = json['academicTermsNameEn'];
    academicYearsId = json['academicYearsId'];
  }

  String getTitle(BuildContext context){
    if( Localizations.localeOf(context).languageCode == 'ar'){
    return academicTermsNameAr??"";}else{
      return academicTermsNameEn??"";
    }
}

  Map<String, dynamic> toMap() {
    return {
      'academicTermsId': academicTermsId,
      'academicTermsNameAr': academicTermsNameAr,
      'academicTermsNameEn': academicTermsNameEn,
      'academicYearsId': academicYearsId,
    };
  }
}
