import '../../../core/imports/app_imports/app_imports.dart';

class CategoryModel {
  String? categoryId;
  String? categoryNameAr;
  String? categoryNameEn;
  String? departmentId;


  CategoryModel({
    this.categoryId,
    this.categoryNameAr,
    this.categoryNameEn,
    this.departmentId,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryNameAr = json['categoryNameAr'];
    categoryNameEn = json['categoryNameEn'];
    departmentId = json['departmentId'];
  }

  String getTitle(BuildContext context){
    if( Localizations.localeOf(context).languageCode == 'ar'){
      return categoryNameAr??"";}else{
      return categoryNameEn??"";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'categoryNameAr': categoryNameAr,
      'categoryNameEn': categoryNameEn,
      'departmentId': departmentId,
    };
  }
}
