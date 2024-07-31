import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class SubCategoryModel {
  String? categoryId;
  String? subCategoryId;
  List<String> subCategoryNameAr;
  List<String> subCategoryNameEn;

  SubCategoryModel({
    this.categoryId,
    this.subCategoryId,
    required this.subCategoryNameAr,
    required this.subCategoryNameEn,
  });

  SubCategoryModel.fromJson(Map<String, dynamic> json)
      : categoryId = json['categoryId'],
        subCategoryId = json['subCategoryId'],
        subCategoryNameAr =
        List<String>.from(json['subCategoryNameAr'].map((x) => x)),
        subCategoryNameEn =
        List<String>.from(json['subCategoryNameEn'].map((x) => x));

  String getTitle(BuildContext context){
    if( Localizations.localeOf(context).languageCode == 'ar'){
      return subCategoryNameAr[0]??"";}else{
      return subCategoryNameEn[0]??"";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
      'subCategoryNameAr': subCategoryNameAr,
      'subCategoryNameEn': subCategoryNameEn,
    };
  }
}



// class SubCategoryModel {
//   String? categoryId;
//   String? subCategoryId;
//   List<String> subCategoryName;
//
//
//   SubCategoryModel({
//     this.categoryId,
//     this.subCategoryId,
//     this.subCategoryName,
//   });
//
//   SubCategoryModel.fromJson(Map<String, dynamic> json) {
//     categoryId = json['categoryId'];
//     subCategoryId = json['subCategoryId'];
//     subCategoryName = ['subCategoryName'];
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'categoryId': categoryId,
//       'subCategoryId': subCategoryId,
//       'subCategoryName': subCategoryName,
//     };
//   }
// }
