class FilesModel {
  String? fileId;
  String? fileName;
  String? yearId;
  String? yearName;
  String? termNameAr;
  String? termNameEn;
  String? termId;
  String? departmentId;
  String? categoryId;
  String? subCategoryId;
  String? subjectId;
  String? subjectNameAr;
  String? subjectNameEn;
  String? sectionId;
  String? sectionNameAr;
  String? sectionNameEn;
  String? fileUrl;
  String? userId;
  String? subCategoryNameAr;
  String? subCategoryNameEn;

  FilesModel({
    this.subjectId,
    this.subjectNameAr,
    this.subjectNameEn,
    this.yearId,
    this.yearName,
    this.termId,
    this.termNameAr,
    this.termNameEn,
    this.sectionId,
    this.sectionNameAr,
    this.sectionNameEn,
    this.departmentId,
    this.categoryId,
    this.subCategoryId,
    this.fileId,
    this.fileName,
    this.fileUrl,
    this.userId,
    this.subCategoryNameAr,
    this.subCategoryNameEn,
  });

  FilesModel.fromJson(Map<String, dynamic> json) {
    subjectId = json['subjectId'];
    subjectNameAr = json['subjectNameAr'];
    subjectNameEn = json['subjectNameEn'];
    yearId = json['yearId'];
    yearName = json['yearName'];
    termId = json['termId'];
    termNameAr = json['termNameAr'];
    termNameEn = json['termNameEn'];
    sectionId = json['sectionId'];
    sectionNameAr = json['sectionNameAr'];
    sectionNameEn = json['sectionNameEn'];
    departmentId = json['departmentId'];
    categoryId = json['categoryId'];
    subCategoryId = json['subCategoryId'];
    fileId = json['fileId'];
    fileName = json['fileName'];
    fileUrl = json['fileUrl'];
    userId = json['userId'];
    subCategoryNameAr = json['subCategoryNameAr'];
    subCategoryNameEn = json['subCategoryNameEn'];
  }

  Map<String, dynamic> toMap() {
    return {
      'subjectId': subjectId,
      'subjectNameAr': subjectNameAr,
      'subjectNameEn': subjectNameEn,
      'yearId': yearId,
      'yearName': yearName,
      'termId': termId,
      'termNameEn': termNameEn,
      'termNameAr': termNameAr,
      'sectionId': sectionId,
      'sectionNameAr': sectionNameAr,
      'sectionNameEn': sectionNameEn,
      'departmentId': departmentId,
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
      'fileId': fileId,
      'fileName': fileName,
      'fileUrl': fileUrl,
      'userId': userId,
      'subCategoryNameAr': subCategoryNameAr,
      'subCategoryNameEn': subCategoryNameEn,
    };
  }
}
