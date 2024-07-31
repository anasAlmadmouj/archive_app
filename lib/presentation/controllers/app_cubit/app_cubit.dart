import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  String? validateDropDown(var value, String? message) {
    if (value == null) {
      return '$message';
    }
    return null;
  }

  String? validateFormField(var value, String? message) {
    if (value.isEmpty || value == null) {
      return '$message';
    }
    return null;
  }

  bool allowBottomSheet = false;
  String? selectedAcademicValue;
  int? selectedIndex;
  var categoryNameArController = TextEditingController();
  var categoryNameEnController = TextEditingController();
  var departmentNameArController = TextEditingController();
  var departmentNameEnController = TextEditingController();
  var subCategoryArController = TextEditingController();
  var subCategoryEnController = TextEditingController();
  var subjectNameArController = TextEditingController();
  var subjectNameEnController = TextEditingController();
  var numberSubjectController = TextEditingController();
  var numberSectionController = TextEditingController();
  var userTypeController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void showSnackBar({required BuildContext context, required String title, required ColorState colorState}) {
    final scaffold = ScaffoldMessenger.of(context);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    scaffold.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: chooseSnackColor(colorState),
        content: Text(title),
        action: SnackBarAction(
          label: AppLocalizations.of(context)!.close,
          onPressed: scaffold.hideCurrentSnackBar,
          textColor: Colors.white,
        ),
      ),
    );
  }

  List<String> academicTermsListEn = [
    ' First Term ',
    ' Second Term ',
    ' Summer Term ',
  ];
  List<String> academicTermsListAr = [
    ' الفصل الأول ',
    ' الفصل الثاني ',
    ' الفصل الصيفي ',
  ];

  List<String> listTermsDropDown(BuildContext context) {
    if (Localizations.localeOf(context).languageCode == 'ar') {
      return academicTermsListAr;
    } else {
      return academicTermsListEn;
    }
  }

  bool isDark = false;
  String? departmentLayOutId;
  List<DepartmentModel?> departmentsList = [];
  DepartmentModel? selectedDepartment = DepartmentModel(
    departmentNameAr: 'القسم',
    departmentNameEn: 'Department',
    departmentHeadId: '-1',
    departmentId: '-1',
  );
  String? languageValue = 'English';

  void changeStartYear({required DateTime dateTime, required BuildContext context}){
    startRangeDateTime = dateTime;
    emit(ChangeYearClearSuccessState());
    Navigator.pop(context);
  }
  void changeEndYear({required DateTime dateTime, required BuildContext context}){
    endRangeDateTime = dateTime;
    emit(ChangeYearClearSuccessState());
    Navigator.pop(context);
  }
  void changeLanguageValue(String? value) {
    languageValue = value;
    CacheHelper.saveData(key: spLanguage, value: value);
    emit(LanguageChangeState());
  }

  void getIsDarkValue() {
    isDark = CacheHelper.getData(key: spIsDark) ?? false;
    emit(ThemChangeState());
  }

  void getLanguageValue() {
    languageValue = CacheHelper.getData(key: spLanguage) ?? 'English';
    emit(ThemChangeState());
  }

  void changeThem(bool value) {
    isDark = value;
    CacheHelper.saveData(key: spIsDark, value: value);
    emit(ThemChangeState());
  }

  void changeDepartment({required DepartmentModel? departmentModel}) {
    selectedDepartment = departmentModel;
    emit(DepartmentChangeState());
  }

  Future<void> getDepartment() async {
    await FireStoreStorage.fireStore
        .collection(departmentCollection)
        .orderBy('departmentNameEn')
        .get()
        .then((value) {
      for (var element in value.docs) {
        departmentsList.add(DepartmentModel.fromJson(element.data()));
      }
    }).catchError((error) {});
  }

  List<SubjectTermModel> subjectTermList = [];
  SubjectTermModel? selectedSubjectTerm = SubjectTermModel(
    academicTermId: '-1',
    subjectNameEn: 'subject',
    subjectNameAr: 'المادة',
    subjectId: '-1',
    subjectTermId: '-1',
    departmentId: '-1',
    subjectCoordinator: '',
    subjectNumber: '-1',
  );

  void changeSubjectTerm({required SubjectTermModel? subjectModel}) {
    selectedSubjectTerm = subjectModel;
    emit(SubjectByTermChangeState());
  }

  Future<void> getSubjectsTerms({
    required BuildContext? context,
    required String? academicTermId,
    required String? departmentId,
  }) async {
    await FireStoreStorage.fireStore
        .collection(subjectsTermCollection)
        .where('departmentId', isEqualTo: departmentId)
        .where('academicTermId', isEqualTo: academicTermId)
        .get()
        .then((value) {
      for (var element in value.docs) {
        subjectTermList.add(SubjectTermModel.fromJson(element.data()));
      }
      emit(GetSubjectByTermSuccessState());
    }).catchError((error) {
      emit(GetSubjectByTermErrorState(error.toString()));
    });
  } // This function retrieves the subjects' terms for a specific academic term and department from Firestore.

  List<UserTypeModel> userTypeList = [];
  UserTypeModel? selectedUserType = UserTypeModel(
    userTypeName: 'User Type',
    userTypeId: '-1',
  );

  void changeUserType({required UserTypeModel? userTypeModel}) {
    selectedUserType = userTypeModel;
    emit(UserTypeChangeState());
  }

  Future<void> getUserType() async {
    await FireStoreStorage.fireStore
        .collection(userTypeCollection)
        .orderBy('userTypeName')
        .get()
        .then((value) {
      for (var element in value.docs) {
        userTypeList.add(UserTypeModel.fromJson(element.data()));
      }
    }).catchError((error) {});
  }

  List<SubCategoryModel> subCategoryList = [];
  SubCategoryModel? selectedSubCategory = SubCategoryModel(
    subCategoryNameAr: ['الفئة الفرعية'],
    subCategoryNameEn: ['Sub Category'],
    subCategoryId: '-1',
    categoryId: '-1',
  );

  void changeSubCategory({required SubCategoryModel? subCategoryModel}) {
    selectedSubCategory = subCategoryModel;
    emit(UserTypeChangeState());
  }

  void getSubCategory({
    required BuildContext context,
    required String? categoryId,
  }) {
    emit(GetSubCategoryLoadingState());
    FireStoreStorage.fireStore
        .collection(subCategoryCollection)
        .where('categoryId', isEqualTo: categoryId)
        .get()
        .then((value) {
      for (var element in value.docs) {
        subCategoryList.add(SubCategoryModel.fromJson(element.data()));
      }
      emit(GetSubCategorySuccessState());
    }).catchError((error) {
      emit(GetSubCategoryErrorState(error));
    });
  }

  List<CategoryModel> categoryList = [];
  CategoryModel? selectedCategory = CategoryModel(
    categoryNameEn: 'Category',
    categoryNameAr: 'الفئة',
    categoryId: '-1',
    departmentId: '-1',
  );

  void changeCategory({required CategoryModel? categoryModel}) {
    selectedCategory = categoryModel;
    emit(ChangeCategorySuccessState());
  }

  Future<void> getCategory() async {
    emit(GetCategoryLoadingState());
    await FireStoreStorage.fireStore
        .collection(categoryCollection)
        .get()
        .then((value) {
      for (var element in value.docs) {
        categoryList.add(CategoryModel.fromJson(element.data()));
      }
      emit(GetCategorySuccessState());
    }).catchError((error) {
      emit(GetCategoryErrorState(error));
    });
  }

  List<AcademicYearsModel> academicYearsList = [];
  AcademicYearsModel? selectedYears = AcademicYearsModel(
    academicYearsNumber: [-1],
    academicYearsId: '-1',
  );

  void changeAcademicYears({required AcademicYearsModel? academicYearsModel}) {
    selectedYears = academicYearsModel;
    emit(AcademicYearsChangeState());
  }

  Future<void> getAcademicYears() async {
    emit(AcademicTermsLoadingState());
    await FireStoreStorage.fireStore
        .collection(academicYearsCollection)
        .orderBy('academicYearsNumber')
        .get()
        .then((value) {
      for (var element in value.docs) {
        academicYearsList.add(AcademicYearsModel.fromJson(element.data()));
      }
      emit(AcademicTermsLoadingState());
    }).catchError((error) {
      emit(AcademicTermsLoadingState());
    });
  }

  List<AcademicTermsModel> academicTermsList = [];
  AcademicTermsModel? selectedAcademicTerm = AcademicTermsModel(
    academicTermsNameEn: 'Academic Term',
    academicTermsNameAr: 'الفصل الدراسي',
    academicYearsId: '-1',
    academicTermsId: '-1',
  );

  void changeAcademicTerms({required AcademicTermsModel? academicTermsModel}) {
    selectedAcademicTerm = academicTermsModel;
    emit(AcademicTermsChangeState());
  }

  Future<void> getAcademicTerms(
      {required BuildContext context, required String? academicYearsId}) async {
    emit(GetAcademicTermsLoadingState());
    await FireStoreStorage.fireStore
        .collection(academicTermsCollection)
        // .orderBy('academicTermsEn')
        .where('academicYearsId', isEqualTo: academicYearsId)
        .get()
        .then((value) {
      for (var element in value.docs) {
        academicTermsList.add(AcademicTermsModel.fromJson(element.data()));
      }
      emit(GetAcademicTermsSuccessState());
    }).catchError((error) {
      emit(GetAcademicTermsErrorState(error.toString()));
    });
  }

  List<SectionModel> sectionList = [];
  SectionModel? selectedSection = SectionModel(
    sectionNameAr: 'الشعبة',
    sectionNameEn: 'Section',
    subjectId: '-1',
    userId: '-1',
    sectionId: '-1',
  );

  void changeSection({required SectionModel? sectionModel}) {
    selectedSection = sectionModel;
    emit(SectionChangeState());
  }

  Future<void> getSection(
      {required BuildContext context, required String? subjectId}) async {
    final user = FirebaseAuth.instance.currentUser;
    emit(GetSectionLoadingState());
    if (user != null && CacheHelper.getData(key: spUserType) == userTypeAdmin) {
      FireStoreStorage.fireStore
          .collection(sectionCollection)
          .where('subjectId', isEqualTo: subjectId)
          .get()
          .then((value) {
        for (var element in value.docs) {
          sectionList.add(SectionModel.fromJson(element.data()));
        }
        emit(GetSectionSuccessState());
      }).catchError((error) {
        emit(GetSectionErrorState(error.toString()));
      });
    } else if (user != null &&
        (CacheHelper.getData(key: spUserType) == userTypeUser ||
            CacheHelper.getData(key: spUserType) == userTypeHeadDepartment)) {
      FireStoreStorage.fireStore
          .collection(subjectsTermCollection)
          .where('subjectTermId', isEqualTo: subjectId)
          .where('subjectCoordinator', isEqualTo: user.uid)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          FireStoreStorage.fireStore
              .collection(sectionCollection)
              .where('subjectId', isEqualTo: subjectId)
              .get()
              .then((value) {
            for (var element in value.docs) {
              sectionList.add(SectionModel.fromJson(element.data()));
            }
            emit(GetSectionSuccessState());
          });
        } else {
          FireStoreStorage.fireStore
              .collection(sectionCollection)
              .where('subjectId', isEqualTo: subjectId)
              .where('userId', isEqualTo: user.uid)
              .get()
              .then((value) {
            for (var element in value.docs) {
              sectionList.add(SectionModel.fromJson(element.data()));
            }
            emit(GetSectionSuccessState());
          });
        }
      }).catchError((error) {
        emit(GetSectionErrorState(error.toString()));
      });
    }
  }

  List<FilesModel> filesList = [];

  void getFiles({
    required String? yearId,
    required String? termId,
    required String? departmentId,
    required String? categoryId,
    required String? subCategoryId,
    required String? subjectId,
  }) {
    emit(GetFilesLoadingState());
    FireStoreStorage.fireStore
        .collection(fileCollection)
        .where('yearId', isEqualTo: yearId)
        .where('termId', isEqualTo: termId)
        .where('departmentId', isEqualTo: departmentId)
        .where('categoryId', isEqualTo: categoryId)
        .where('subCategoryId', isEqualTo: subCategoryId)
        .where('subjectId', isEqualTo: subjectId)
        .get()
        .then((value) {
      print(value);
      print('دخلت');
      for (var element in value.docs) {
        print('ana');
        filesList.add(FilesModel.fromJson(element.data()));
        print(element.data());
      }
      print('done');
      for (var ele in filesList) {
        print(ele.subjectNameEn);
      }
      emit(GetFilesSuccessState());
    }).catchError((error) {
      emit(GetFilesErrorState(error.toString()));
    });
  }

  void getUserFiles({
    required String? yearId,
    required String? termId,
    required String? departmentId,
    required String? categoryId,
    required String? subjectId,
    required String? sectionId,
  }) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(GetFilesLoadingState());
      FireStoreStorage.fireStore
          .collection(fileCollection)
          // .orderBy('yearName')
          .where('yearId', isEqualTo: yearId)
          .where('termId', isEqualTo: termId)
          .where('departmentId', isEqualTo: departmentId)
          .where('categoryId', isEqualTo: categoryId)
          // .where('subCategoryId', isEqualTo: subCategoryId)
          .where('subjectId', isEqualTo: subjectId)
          // .where('userId', isEqualTo: user.uid)
          .where('sectionId', isEqualTo: sectionId)
          .get()
          .then((value) {
        for (var element in value.docs) {
          filesList.add(FilesModel.fromJson(element.data()));
        }
        emit(GetFilesSuccessState());
      }).whenComplete(() {
        FireStoreStorage.fireStore
            .collection(fileCollection)
            // .orderBy('yearName')
            .where('yearId', isEqualTo: yearId)
            .where('termId', isEqualTo: termId)
            .where('departmentId', isEqualTo: departmentId)
            .where('categoryId', isEqualTo: categoryId)
            .where('subjectId', isEqualTo: subjectId)
            .where('subCategoryName', isEqualTo: 'تنفيذ وتقييم اداء الطلبة')
            .get()
            .then((value) {
          for (var element in value.docs) {
            filesList.add(FilesModel.fromJson(element.data()));
          }
          emit(GetCordinatorSubCategoySuccessState());
        });
      }).catchError((error) {
        emit(GetSubjectByTermErrorState(error.toString()));
      });
    }
  } // This function retrieves files based on various filters such as yearId, termId, departmentId, categoryId, subCategoryId, and subjectId from Firestore.

  List<FilesModel> filesRangeList = [];
  DateTime startRangeDateTime = DateTime(-1);
  DateTime endRangeDateTime = DateTime(-1);
  List<AcademicYearsModel> yearsIdList = [];
  List<AcademicYearsModel> uniqueYearsIdList = [];
  bool isSelectRange = false;

  void getFilesRange({
    required String? departmentId,
    required String? categoryId,
    required String? subCategoryId,
    required String? subjectId,
    required int? startYear,
    required int? endYear,
  }) {
    emit(GetFilesLoadingState());
    FireStoreStorage.fireStore
        .collection(academicYearsCollection)
        .where('academicYearsNumber',
            isGreaterThanOrEqualTo: [startYear],
            isLessThanOrEqualTo: [(endYear! + 1)])
        .get()
        .then((value) {
          for (var element in value.docs) {
            yearsIdList.add(AcademicYearsModel.fromJson(element.data()));
          }
          yearsIdList = yearsIdList.toSet().toList();
          var seen = <String?>{};
          uniqueYearsIdList = yearsIdList
              .where((year) => seen.add(year.academicYearsId))
              .toList();
        })
        .whenComplete(() {
          for (int i = 0; i < uniqueYearsIdList.length; i++) {
            FireStoreStorage.fireStore
                .collection(fileCollection)
                .where('yearId',
                    isEqualTo: uniqueYearsIdList[i].academicYearsId)
                .where('departmentId', isEqualTo: departmentId)
                .where('categoryId', isEqualTo: categoryId)
                .where('subCategoryId', isEqualTo: subCategoryId)
                .where('subjectId', isEqualTo: subjectId)
                .get()
                .then((value) {
              for (var element in value.docs) {
                filesList.add(FilesModel.fromJson(element.data()));
              }
              emit(GetFilesSuccessState());
            });
          }
        })
        .catchError((error) {
          emit(GetFilesErrorState(error.toString()));
        });
  } // This function retrieves files within a specified range of academic years, along with other filters such as departmentId, categoryId, subCategoryId, and subjectId, from Firestore.

  List<SubjectTermModel> subjectList = [];
  List<SubjectTermModel> uniqueSubjectList = [];
  List<String> sectionIdList = [];
  List<SubjectTermModel> headDepartmentSubjectList = [];

  SubjectTermModel? selectedUploadSubject = SubjectTermModel(
    academicTermId: '-1',
    subjectCoordinator: '-1',
    subjectId: '-1',
    subjectTermId: '-1',
  );

  Future<void> getSubject({
    required BuildContext context,
    required String? academicTermId,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(GetSubjectLoadingState());
      await FireStoreStorage.fireStore
          .collection(sectionCollection)
          .where('userId', isEqualTo: user.uid)
          .get()
          .then((value) {
        for (var element in value.docs) {
          sectionIdList
              .add(SectionModel.fromJson(element.data()).subjectId.toString());
        }
        emit(GetSectionIdListSuccessState());
      }).whenComplete(() {
        for (var element in sectionIdList) {
          FireStoreStorage.fireStore
              .collection(subjectsTermCollection)
              .where('subjectTermId', isEqualTo: element)
              .where('academicTermId', isEqualTo: academicTermId)
              .get()
              .then((value) {
            for (var element in value.docs) {
              subjectList.add(SubjectTermModel.fromJson(element.data()));
            }
            subjectList = subjectList.toSet().toList();
            var seen = <String?>{};
            uniqueSubjectList = subjectList
                .where((subject) => seen.add(subject.subjectNameAr))
                .toList();
          });
        }
        emit(GetSubjectSuccessState());
      });
    }
  }

  List<SubjectsModel> subjectsList = [];
  SubjectsModel? selectedSubjects = SubjectsModel(
    departmentId: '-1',
    subjectNameEn: 'Subject',
    subjectNameAr: 'المادة',
    subjectId: '-1',
    numberSubject: '-1',
  );

  void changeSubjects({required SubjectsModel? subjectsModel}) {
    selectedSubjects = subjectsModel;
    emit(SubjectByTermChangeState());
  }

  Future<void> getSubjects({
    required BuildContext context,
    required String? departmentId,
  }) async {
    await FireStoreStorage.fireStore
        .collection(subjectsCollection)
        // .orderBy('subjectName')
        .where('departmentId', isEqualTo: departmentId)
        .get()
        .then((value) {
      for (var element in value.docs) {
        subjectsList.add(SubjectsModel.fromJson(element.data()));
      }
      emit(GetSelectedAcademicTermIdSuccessState());
    }).catchError((error) {});
  }

  List<String> userSectionList = [];
  List<UsersModel> allUserSubjectList = [];
  List<UsersModel> userSubjectList = [];
  UsersModel? selectedUserSubject = UsersModel(
    userName: 'User',
    userId: '-1',
    userTypeId: '-1',
    departmentId: '-1',
    userEmail: '-1',
  );

  void changeUserSubject({required UsersModel? usersModel}) {
    selectedUserSubject = usersModel;
    emit(ChangeUserSubjectState());
  }

  Future<void> getSubjectUser({
    required String? subjectId,
  }) async {
    emit(GetUserSubjectLoadingState());
    await FireStoreStorage.fireStore
        .collection(sectionCollection)
        .where('subjectId', isEqualTo: subjectId)
        .get()
        .then((value) {
      for (var element in value.docs) {
        userSectionList
            .add(SectionModel.fromJson(element.data()).userId.toString());
        emit(GetUserSectionSuccessState());
      }
    }).whenComplete(() async {
      for (var element in userSectionList) {
        await FireStoreStorage.fireStore
            .collection(usersCollection)
            .where('userId', isEqualTo: element)
            .get()
            .then((value) {
          for (var element in value.docs) {
            allUserSubjectList.add(UsersModel.fromJson(element.data()));
          }
          allUserSubjectList = allUserSubjectList.toSet().toList();
          var seen = <String?>{};
          userSubjectList = allUserSubjectList
              .where((userSubject) => seen.add(userSubject.userName))
              .toList();
        });
      }
      emit(GetUserSubjectSuccessState());
    }).catchError((error) {
      emit(GetUserSubjectErrorState(error.toString()));
    });
  }

  List<SubjectTermModel> coordinatorIdList = [];
  List<SubCategoryModel> subCategoryIsCoordinatorList = [];
  SubCategoryModel? selectedSubCategoryCoordinator = SubCategoryModel(
      categoryId: '-1',
      subCategoryId: '-1',
      subCategoryNameAr: ['الفئة الفرعية'],
      subCategoryNameEn: ['Sub category']);

  void changeSubCategoryCoordinator(
      {required SubCategoryModel? subCategoryModel}) {
    selectedSubCategoryCoordinator = subCategoryModel;
    emit(ChangeCoordinatorIdSuccessState());
  }

  void getSubCategoryIsCoordinator({
    required String? subjectId,
    required String? categoryId,
    required BuildContext context,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(GetCoordinatorIdLoadingState());
      await FireStoreStorage.fireStore
          .collection(subjectsTermCollection)
          .where('subjectTermId', isEqualTo: subjectId)
          .where('subjectCoordinator', isEqualTo: user.uid)
          .get()
          .then((value) {
        for (var element in value.docs) {
          coordinatorIdList.add(SubjectTermModel.fromJson(element.data()));
        }
        emit(GetCoordinatorIdSuccessState());
      }).whenComplete(() {
        if (coordinatorIdList.isNotEmpty) {
          if (coordinatorIdList.single.subjectCoordinator.toString() ==
              user.uid) {
            FireStoreStorage.fireStore
                .collection(subCategoryCollection)
                .where('categoryId', isEqualTo: categoryId)
                .get()
                .then((value) {
              for (var element in value.docs) {
                subCategoryIsCoordinatorList
                    .add(SubCategoryModel.fromJson(element.data()));
              }
            });
          }
        } else {
          FireStoreStorage.fireStore
              .collection(subCategoryCollection)
              .where('categoryId', isEqualTo: categoryId)
              .where('subCategoryName', arrayContainsAny: [
                'نموذج الحضور والغياب',
                'نموذج توثيق التقدم للإمتحان',
                'نموذج حرمان',
                'نموذج الأسألة',
                'نموذج الإجابة',
              ])
              .get()
              .then((value) {
                for (var element in value.docs) {
                  subCategoryIsCoordinatorList
                      .add(SubCategoryModel.fromJson(element.data()));
                }
                emit(GetSubCategorySuccessState());
              });
        }
      });
    }
  }

  Future<void> deleteFile({
    required String? fileId,
  }) async {
    await FireStoreStorage.fireStore
        .collection(fileCollection)
        .doc(fileId)
        .delete()
        .then((value) {
      emit(DeleteFilesSuccessState());
    }).catchError((error) {
      emit(DeleteFilesErrorState(error.toString()));
    });
  } // This function deletes a file from Firestore based on the provided fileId.




  bool get termsIsValid => selectedYears?.academicYearsId != '-1';

  bool get departmentValid => selectedAcademicTerm?.academicTermsId != '-1';

  bool get adminUserSubjectValid => selectedAcademicTerm?.academicTermsId != '-1';

  bool get subCategoryValid => selectedCategory?.categoryId != '-1';

  bool get isSectionHaseData => sectionList.isNotEmpty;

  bool get adminUserSubjectHaseData => uniqueSubjectList.isNotEmpty;

  bool get isUserSubjectHaseData => userSubjectList.isNotEmpty;

  bool get isSectionValid => selectedSubjectTerm?.subjectTermId != '-1';

  bool get isUserSubjectValid => selectedSubjectTerm?.subjectTermId != '-1';

  bool get isSubjectValid =>
      selectedAcademicTerm!.academicTermsId != '-1' ||
      selectedDepartment!.departmentId != '-1';

  bool get isUploadSectionValid => selectedUploadSubject!.subjectTermId != '-1';

  bool get isAllSubjectsValid => selectedDepartment!.departmentId != '-1';

  bool get isSubjectHasData => subjectTermList.isNotEmpty;

  bool get isSubjectUploadHasData => subjectList.isNotEmpty;

  bool get isAllSubjectsHasData => subjectsList.isNotEmpty;

  void uploadTermsOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeAcademicTerms(academicTermsModel: academicTermsList[index]);
    ClearCubit.get(context).defaultDepartment();
    ClearCubit.get(context).defaultCategory();
    if (CacheHelper.getData(key: spUserType) == userTypeAdmin) {
      ClearCubit.get(context).defaultSubCategory();
    } else {
      ClearCubit.get(context).defaultSubCategoryCoordinator();
    }
  }

  void termsSubjectOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeAcademicTerms(academicTermsModel: academicTermsList[index]);
    ClearCubit.get(context).defaultDepartment();
    ClearCubit.get(context).defaultSubjectTerm();
    ClearCubit.get(context).defaultSection();
    ClearCubit.get(context).defaultUserSubject();
  }

  void termsSelectOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeAcademicTerms(academicTermsModel: academicTermsList[index]);
    ClearCubit.get(context).defaultCategory();
    ClearCubit.get(context).defaultSubCategory();
    ClearCubit.get(context).defaultUserSubject();
    ClearCubit.get(context).defaultSubjectTerm();
    ClearCubit.get(context).defaultDepartment();
  }

  void termsSubjectTermsOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeAcademicTerms(academicTermsModel: academicTermsList[index]);
    ClearCubit.get(context).defaultDepartment();
    ClearCubit.get(context).defaultSubjects();
  }
  void addTermsOnTap({required int index, required BuildContext context ,}) {
    maybePop(context);
    selectedAcademicValue = listTermsDropDown(context)[index];
    selectedIndex = listTermsDropDown(context).indexWhere((element) => element == listTermsDropDown(context)[index]);
    emit(ChangeTermClearSuccessState());
  }

  void numberSectionOnTap({required int index, required BuildContext context ,}) {
    maybePop(context);
    AdminCubit.get(context).numberSection = numberSectionList[index];
    emit(ChangeSectionClearSuccessState());
  }

  void yearsAcademicTermsOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeAcademicYears(academicYearsModel: academicYearsList[index]);
    academicTermsList.clear();
    getAcademicTerms(
        context: context, academicYearsId: selectedYears?.academicYearsId);
  }

  void yearsSectionOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeAcademicYears(academicYearsModel: academicYearsList[index]);
    academicTermsList.clear();
    getAcademicTerms(
        context: context, academicYearsId: selectedYears?.academicYearsId);
    ClearCubit.get(context).defaultAcademicTerm();
    ClearCubit.get(context).defaultDepartment();
    ClearCubit.get(context).defaultSubjectTerm();
    ClearCubit.get(context).defaultSection();
  }

  void yearsSubjectOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeAcademicYears(academicYearsModel: academicYearsList[index]);
    academicTermsList.clear();
    getAcademicTerms(
        context: context, academicYearsId: selectedYears?.academicYearsId);
    ClearCubit.get(context).defaultAcademicTerm();
    ClearCubit.get(context).defaultDepartment();
    ClearCubit.get(context).defaultSubjects();
    ClearCubit.get(context).defaultUserSubject();
    ClearCubit.get(context).defaultSubjectTerm();
  }

  void yearsSelectOnTap({required int index, required BuildContext context}) {
    pop(context);
    changeAcademicYears(academicYearsModel: academicYearsList[index]);
    academicTermsList.clear();
    ClearCubit.get(context).defaultAcademicTerm();
    getAcademicTerms(context: context, academicYearsId: selectedYears?.academicYearsId);
    ClearCubit.get(context).defaultCategory();
    ClearCubit.get(context).defaultSubCategory();
    ClearCubit.get(context).defaultUserSubject();
    ClearCubit.get(context).defaultSubjectTerm();
    ClearCubit.get(context).defaultDepartment();
  }

  void yearsUploadOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeAcademicYears(academicYearsModel: academicYearsList[index]);
    academicTermsList.clear();
    getAcademicTerms(
        context: context, academicYearsId: selectedYears?.academicYearsId);
    ClearCubit.get(context).defaultAcademicTerm();
    ClearCubit.get(context).defaultDepartment();
    ClearCubit.get(context).defaultCategory();
    ClearCubit.get(context).defaultSubjects();
    ClearCubit.get(context).defaultUserSubject();
    ClearCubit.get(context).defaultSubjectTerm();
    if (CacheHelper.getData(key: spUserType) == userTypeAdmin) {
      ClearCubit.get(context).defaultSubCategory();
    } else {
      ClearCubit.get(context).defaultSubCategoryCoordinator();
    }
  }

  void categorySelectOnTap({required int index, required BuildContext context}) async {
    maybePop(context);
    changeCategory(categoryModel: categoryList[index]);
    subCategoryList.clear();
    ClearCubit.get(context).defaultSubCategory();
    getSubCategory(context: context, categoryId: selectedCategory!.categoryId);
    if (selectedCategory?.categoryNameEn == subjectModel &&
        (CacheHelper.getData(key: spUserType) == userTypeAdmin ||
            CacheHelper.getData(key: spUserType) == userTypeHeadDepartment)) {
      subjectTermList.clear();
      ClearCubit.get(context).defaultSubjectTerm();
      getSubjectsTerms(
          departmentId: selectedDepartment?.departmentId,
          context: context,
          academicTermId: selectedAcademicTerm?.academicTermsId);
    } else if (selectedCategory?.categoryNameEn == subjectModel &&
        CacheHelper.getData(key: spUserType) == userTypeUser) {
      subjectList.clear();
      uniqueSubjectList.clear();
      ClearCubit.get(context).defaultUploadSubject();
      await getSubject(
        context: context,
        academicTermId: selectedAcademicTerm?.academicTermsId,
      );
    } else {
      subjectTermList.clear();
      ClearCubit.get(context).defaultSubjectTerm();
    }
  }

  void categorySelectRangeOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeCategory(categoryModel: categoryList[index]);
    subCategoryList.clear();
    ClearCubit.get(context).defaultSubCategory();
    getSubCategory(context: context, categoryId: selectedCategory?.categoryId);
    if (selectedCategory?.categoryNameEn == subjectModel) {
      subjectsList.clear();
      ClearCubit.get(context).defaultSubjects();
      getSubjects(
          context: context, departmentId: selectedDepartment!.departmentId);
    }
  }

  void categoryUploadOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeCategory(categoryModel: categoryList[index]);
    subCategoryList.clear();
    ClearCubit.get(context).defaultSubCategory();
    getSubCategory(context: context, categoryId: selectedCategory!.categoryId);

    if (CacheHelper.getData(key: spUserType) == userTypeAdmin) {
      changeCategory(categoryModel: categoryList[index]);
      subCategoryList.clear();
      ClearCubit.get(context).defaultSubCategory();
      if (selectedCategory!.categoryNameEn == subjectModel) {
        ClearCubit.get(context).defaultSection();
        subjectTermList.clear();
        ClearCubit.get(context).defaultSubjectTerm();
        getSubjectsTerms(
            context: context,
            academicTermId: selectedAcademicTerm!.academicTermsId,
            departmentId: selectedDepartment!.departmentId);
      }
    } else {
      changeCategory(categoryModel: categoryList[index]);
      subCategoryIsCoordinatorList.clear();
      ClearCubit.get(context).defaultSubCategoryCoordinator();
      if (selectedCategory!.categoryNameEn == subjectModel) {
        ClearCubit.get(context).defaultSection();
        subjectList.clear();
        ClearCubit.get(context).defaultUploadSubject();
        getSubject(
          academicTermId:
              selectedAcademicTerm?.academicTermsId,
          context: context,
        );
      }
    }
  }

  void departmentOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeDepartment(departmentModel: departmentsList[index]);
    ClearCubit.get(context).changeDepartmentClear();
  }

  void departmentSubjectTermOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeDepartment(departmentModel: departmentsList[index]);
    subjectTermList.clear();
    getSubjectsTerms(
        context: context,
        academicTermId: selectedAcademicTerm!.academicTermsId,
        departmentId: selectedDepartment!.departmentId);
    ClearCubit.get(context).defaultSubjectTerm();
    ClearCubit.get(context).defaultSection();
    ClearCubit.get(context).defaultUserSubject();
  }

  void departmentSubjectsOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeDepartment(departmentModel: departmentsList[index]);
    ClearCubit.get(context).changeDepartmentClear();
    subjectsList.clear();
    getSubjects(
        context: context, departmentId: selectedDepartment!.departmentId);
    ClearCubit.get(context).defaultSubjects();
    emit(SubjectByTermChangeState());
  }

  void subCategoryOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSubCategory(subCategoryModel: subCategoryList[index]);
  }

  void subCategoryUploadOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSubCategory(subCategoryModel: subCategoryList[index]);
    ClearCubit.get(context).defaultSection();
  }

  void userTypeOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeUserType(userTypeModel: userTypeList[index]);
  }

  void sectionOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSection(sectionModel: sectionList[index]);
  }

  void subjectCoordinatorOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSubjectTerm(subjectModel: subjectTermList[index]);
    ClearCubit.get(context).changeSubjectClear();
    userSubjectList.clear();
    allUserSubjectList.clear();
    userSectionList.clear();
    ClearCubit.get(context).defaultUserSubject();
    getSubjectUser(subjectId: selectedSubjectTerm?.subjectTermId);
  }

  void subjectSectionOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSubjectTerm(subjectModel: subjectTermList[index]);
    sectionList.clear();
    ClearCubit.get(context).defaultSection();
    getSection(
        context: context,
        subjectId: selectedSubjectTerm?.subjectTermId);
  }

  void allSubjectsOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSubjects(subjectsModel: subjectsList[index]);
  }

  void adminUploadSubjectOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSubjectTerm(subjectModel: subjectTermList[index]);
    ClearCubit.get(context).defaultSection();
    sectionList.clear();
    ClearCubit.get(context).defaultSubCategory();
    getSection(
        context: context,
        subjectId: selectedSubjectTerm?.subjectTermId);
    subCategoryList.clear();
    getSubCategory(
        context: context,
        categoryId: selectedCategory?.categoryId);
  }

  void uploadSubjectOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSubjectTerm(subjectModel: uniqueSubjectList[index]);
    ClearCubit.get(context).defaultSection();
    sectionList.clear();
    getSection(
        context: context,
        subjectId: selectedUploadSubject?.subjectTermId);
    subCategoryIsCoordinatorList.clear();
    coordinatorIdList.clear();
    ClearCubit.get(context).defaultSubCategoryCoordinator();
    getSubCategoryIsCoordinator(
        subjectId: selectedUploadSubject?.subjectTermId,
        context: context,
        categoryId: selectedCategory?.categoryId);
  }

  void categoryOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeCategory(categoryModel: categoryList[index]);
  }

  void userSubjectOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeUserSubject(usersModel: userSubjectList[index]);
  }

  void adminSubjectUserOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSubjectTerm(subjectModel: uniqueSubjectList[index]);
    ClearCubit.get(context).defaultSection();
    sectionList.clear();
    getSection(
        context: context,
        subjectId: selectedUploadSubject?.subjectTermId);
  }

  void subjectUserOnTap({required int index, required BuildContext context}) {
    maybePop(context);
    changeSubjectTerm(subjectModel: subjectTermList[index]);
    ClearCubit.get(context).defaultSection();
    sectionList.clear();
    getSection(
        context: context,
        subjectId: selectedSubjectTerm?.subjectTermId);
  }

  Future<void> addTermButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if (formKey.currentState!.validate()) {
      if (selectedYears?.academicYearsId == '-1') {
        showSnackBar(
            context: context,
            title: AppLocalizations.of(context)!.pleaseSelectYear,
            colorState: ColorState.error);
      }
      else {
        await AdminCubit.get(context).checkIsTermAvailable(
            academicYearId: selectedYears?.academicYearsId,
            academicTermName: selectedAcademicValue)
            .then((isSuccess) {
            if (!isSuccess) {
              showSnackBar(
                  context: context,
                  title:
                  '${AppLocalizations.of(context)!.theTermIsExit} (${selectedYears?.academicYearsNumber.join('/').toString()})',
                  colorState: ColorState.error
              );
              ClearCubit.get(context).defaultAcademicYear();
              AdminCubit.get(context).checkTermList.clear();
            }
            else {
              Uuid id = const Uuid();
              String academicTermsId = id.v1();
              AcademicTermsModel academicTermsModel =
              AcademicTermsModel(
                academicTermsId: academicTermsId,
                academicTermsNameAr: selectedIndex == 0 ? 'الفصل الدراسي الأول'
                    : selectedIndex == 1 ? 'الفصل الدراسي الثاني'
                    : 'الفصل الدراسي الصيفي',
                academicYearsId: selectedYears!.academicYearsId,
                academicTermsNameEn: selectedIndex == 0 ? 'First Term'
                    : selectedIndex == 1 ? 'Second Term'
                    : 'Summer Term',
              );
              AdminCubit.get(context).createAcademicTerms(
                academicTermsModel: academicTermsModel,
              );
              ClearCubit.get(context).defaultAcademicYear();
            }
          },
        );
      }
    }
  }

  Future<void> addYearButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if(AdminCubit.get(context).startDateTime == DateTime(-1)){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectStartYear, colorState: ColorState.error);
    }
    else if(AdminCubit.get(context).endDateTime == DateTime(-1)){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectYear , colorState: ColorState.error);
    }
    else{
      await AdminCubit.get(context).checkIsYearAvailable().then((isSuccess) {
        if(!isSuccess){
          showSnackBar(context: context, title: AppLocalizations.of(context)!.yearExist , colorState: ColorState.error);
          AdminCubit.get(context).startDateTime = DateTime(-1);
          AdminCubit.get(context).endDateTime = DateTime(-1);
          AdminCubit.get(context).checkYearList.clear();
        }
        else {
          Uuid id = const Uuid();
          String academicYearsId = id.v1();
          AcademicYearsModel academicYearsModel =
          AcademicYearsModel(
            academicYearsId: academicYearsId,
            academicYearsNumber: [AdminCubit.get(context).startDateTime.year ,
              AdminCubit.get(context).endDateTime.year ],
          );
          AdminCubit.get(context).createAcademicYears(
              academicYearsModel: academicYearsModel);
          AdminCubit.get(context).startDateTime = DateTime(-1);
          AdminCubit.get(context).endDateTime = DateTime(-1);
        }
      });

    }  }

  Future<void> addCategoryButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if(selectedDepartment?.departmentId == '-1'
        && formKey.currentState!.validate()){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectDepartment , colorState: ColorState.error);
    }
    else if(formKey.currentState!.validate()){
      AdminCubit.get(context).checkIsCategoryAvailable(
          categoryName: categoryNameArController.text)
          .then((isSuccess) {
        if(!isSuccess){
          showSnackBar(context: context, title: AppLocalizations.of(context)!.categoryExist , colorState: ColorState.error);
        }
        else{
          Uuid id = const Uuid();
          String categoryId = id.v1();
          CategoryModel categoryModel = CategoryModel(
            categoryNameAr: categoryNameArController.text,
            categoryNameEn: categoryNameEnController.text,
            departmentId: selectedDepartment?.departmentId,
            categoryId: categoryId,
          );
          AdminCubit.get(context).createCategory(
              categoryModel: categoryModel);
          categoryNameArController.clear();
          categoryNameEnController.clear();
          ClearCubit.get(context).defaultDepartment();
        }
      });
    }
  }

  Future<void> addCoordinatorButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if (selectedYears?.academicYearsId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectYear , colorState: ColorState.error);
    }
    else if (selectedAcademicTerm?.academicTermsId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectTerm , colorState: ColorState.error);
    }
    else if (selectedDepartment?.departmentId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectDepartment , colorState: ColorState.error);
    }
    else if(selectedSubjectTerm?.subjectTermId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubject , colorState: ColorState.error);
    }
    else if(selectedUserSubject?.userId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectCoordinator , colorState: ColorState.error);
    }
    else {
      AdminCubit.get(context).createCoordinatorToSubject(
        subjectTermId: selectedSubjectTerm?.subjectTermId ?? '',
        subjectCoordinator: selectedUserSubject?.userId ?? '-1',
      );
      ClearCubit.get(context).defaultAcademicYear();
      ClearCubit.get(context).defaultAcademicTerm();
      ClearCubit.get(context).defaultDepartment();
      ClearCubit.get(context).defaultSubjectTerm();
      ClearCubit.get(context).defaultUserSubject();
    }
  }

  Future<void> addSectionButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if (selectedYears?.academicYearsId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectYear , colorState: ColorState.error);
    }
    else if (selectedAcademicTerm?.academicTermsId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectTerm , colorState: ColorState.error);
    }
    else if (selectedDepartment?.departmentId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectDepartment , colorState: ColorState.error);
    }
    else if(selectedSubjectTerm?.subjectTermId == '-1' && formKey.currentState!.validate()){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubject , colorState: ColorState.error);
    }
    else if(selectedSection?.sectionId == '-1' && formKey.currentState!.validate()){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSection , colorState: ColorState.error);
    }
    else if(AdminCubit.get(context).selectedUsers?.userId == '-1' && formKey.currentState!.validate()){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectUser , colorState: ColorState.error);
    }
    else if (formKey.currentState!.validate()) {
      AdminCubit.get(context).updateSection(
        sectionId:selectedSection?.sectionId,
        userId: AdminCubit.get(context).selectedUsers?.userId,);
      ClearCubit.get(context).defaultAcademicYear();
      ClearCubit.get(context).defaultAcademicTerm();
      ClearCubit.get(context).defaultDepartment();
      ClearCubit.get(context).defaultSubjectTerm();
      ClearCubit.get(context).defaultSection();
      AdminCubit.get(context).defaultUsers();
    }  }

  Future<void> addDepartmentButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if (formKey.currentState!.validate()) {
      AdminCubit.get(context)
          .checkIsDepartmentAvailable(
          departmentName:
          departmentNameArController.text)
          .then((isSuccess) {
        if (!isSuccess) {
          showSnackBar(context: context, title: AppLocalizations.of(context)!.departmentExist , colorState: ColorState.error);
          AdminCubit.get(context).defaultUsers();
          departmentNameArController.clear();
        } else {
          Uuid id = const Uuid();
          String departmentId = id.v1();
          DepartmentModel departmentModel = DepartmentModel(
            departmentNameAr:
            departmentNameArController.text,
            departmentId: departmentId,
            departmentNameEn:
            departmentNameEnController.text,
            departmentHeadId: AdminCubit.get(context).selectedUsers!.userId,
          );
          AdminCubit.get(context).createDepartment(
              departmentModel: departmentModel);
          AdminCubit.get(context).defaultUsers();
          departmentNameArController.clear();
          departmentNameEnController.clear();
        }
      });
    }
  }

  Future<void> addSubCategoryButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if(selectedCategory?.categoryId == '-1' && formKey.currentState!.validate())
    {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectCategory , colorState: ColorState.error);
    }
    else if(formKey.currentState!.validate()){
      AdminCubit.get(context).checkIsSubCategoryAvailable(
          categoryId: selectedCategory?.categoryId,
          subCategoryName: subCategoryArController.text).then((isSuccess) {
        if(!isSuccess){
          showSnackBar(context: context, title:  AppLocalizations.of(context)!.subCategoryExist, colorState: ColorState.error);
        }
        else{
          Uuid id = const Uuid();
          String subCategoryId = id.v1();
          SubCategoryModel subCategoryModel =
          SubCategoryModel(
            categoryId: selectedCategory!.categoryId,
            subCategoryId: subCategoryId,
            subCategoryNameAr: [subCategoryArController.text],
            subCategoryNameEn: [subCategoryEnController.text],
          );
          AdminCubit.get(context).createSubCategory(
            subCategoryModel: subCategoryModel,
          );
          subCategoryArController.clear();
          subCategoryEnController.clear();
          ClearCubit.get(context).defaultSubCategory();
        }
      });

    }  }

  Future<void> addSubjectButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if (selectedDepartment?.departmentId == '-1' &&
        formKey.currentState!.validate()) {
      showSnackBar(
          context: context,
          title: AppLocalizations.of(context)!.pleaseSelectDepartment,
          colorState: ColorState.error);
    }
    else if (formKey.currentState!.validate()) {
      AdminCubit.get(context).checkIsSubjectAvailable(subjectNumber: numberSubjectController.text)
          .then((isSuccess) {
        if (!isSuccess) {
          showSnackBar(
              context: context,
              title: AppLocalizations.of(context)!.numberSubjectExist,
              colorState: ColorState.error);
          ClearCubit.get(context).defaultDepartment();
          subjectNameArController.clear();
          subjectNameEnController.clear();
          numberSubjectController.clear();
        }
        else {
          Uuid id = const Uuid();
          String subjectId = id.v1();
          SubjectsModel subjectsModel = SubjectsModel(
            subjectNameAr: subjectNameArController.text,
            subjectId: subjectId,
            departmentId: selectedDepartment?.departmentId ?? '',
            numberSubject: numberSubjectController.text,
            subjectNameEn: subjectNameEnController.text,
          );
          AdminCubit.get(context).createSubject(
            subjectsModel: subjectsModel,
          );
          ClearCubit.get(context).defaultDepartment();
          subjectNameArController.clear();
          subjectNameEnController.clear();
          numberSubjectController.clear();
        }
      });
    }
  }

  Future<void> addSubjectTermButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if (selectedYears?.academicYearsId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectYear , colorState: ColorState.error);
    }
    else if (selectedAcademicTerm?.academicTermsId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectTerm , colorState: ColorState.error);
    }
    else if (selectedDepartment?.departmentId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectDepartment , colorState: ColorState.error);
    }
    else if (selectedSubjects?.subjectId == '-1' && formKey.currentState!.validate()) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubject , colorState: ColorState.error);
    }
    else if (formKey.currentState!.validate()) {
      await AdminCubit.get(context).checkIsSubjectTermAvailable(
          academicTermId: selectedAcademicTerm?.academicTermsId,
          subjectNumber: selectedSubjects?.numberSubject)
          .then((isSuccess) {
        if (isSuccess) {
          Uuid id = const Uuid();
          String subjectTermId = id.v1();
          SubjectTermModel subjectTermModel =
          SubjectTermModel(
            subjectTermId: subjectTermId,
            subjectId:selectedSubjects?.subjectId ?? '-1',
            academicTermId: selectedAcademicTerm?.academicTermsId ?? '-1',
            departmentId: selectedSubjects?.departmentId ?? '-1',
            subjectNumber: selectedSubjects?.numberSubject ?? '-1',
            subjectNameAr: selectedSubjects?.subjectNameAr ?? '',
            subjectNameEn: selectedSubjects?.subjectNameEn ?? '',
          );
          AdminCubit.get(context).createSubjectsTerm(
            subjectsTermModel: subjectTermModel,
          );
          ClearCubit.get(context).defaultAcademicTerm();
          ClearCubit.get(context).defaultAcademicYear();
          ClearCubit.get(context).defaultDepartment();
          ClearCubit.get(context).defaultSubjects();
          for (int i = 1; i <= (AdminCubit.get(context).numberSection ?? 0); i++) {
            Uuid idSec = const Uuid();
            String sectionId = idSec.v1();
            SectionModel sectionModel =
            SectionModel(
              subjectId: subjectTermId,
              sectionId: sectionId,
              sectionNameEn: 'section $i',
              sectionNameAr: '$i شعبة ',
            );
            AdminCubit.get(context).createSection(
                sectionModel: sectionModel);
          }
          AdminCubit.get(context).checkSubjectTermList.clear();
        }
        else {
          showSnackBar(context: context, title: AppLocalizations.of(context)!.subjectExistTerm, colorState: ColorState.error);
          AdminCubit.get(context).checkSubjectTermList.clear();
        }
      });
    }
  }

  Future<void> addUserTypeButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if(formKey.currentState!.validate()){
      Uuid id = const Uuid();
      String userTypeId = id.v1();
      UserTypeModel userTypeModel = UserTypeModel(
        userTypeId: userTypeId,
        userTypeName: userTypeController.text,
      );
      AdminCubit.get(context).createUserType(
        userTypeModel: userTypeModel,);
      userTypeController.clear();
    }

  }

  Future<void> createUserButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if(selectedDepartment?.departmentId == '-1' && formKey.currentState!.validate())
    {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectDepartment , colorState: ColorState.error);
    }
    else if(selectedUserType?.userTypeId == '-1' && formKey.currentState!.validate())
    {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectUserType , colorState: ColorState.error);
    }
    else if (formKey.currentState!.validate())
    {
      await AdminCubit.get(context).registerUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        userTypeId: selectedUserType!.userTypeId.toString(),
        departmentId: selectedDepartment?.departmentId ?? '',
      );
      if(selectedUserType?.userTypeName == 'Head Department'){
        AdminCubit.get(context).updateHeadDepartment(
            departmentId: selectedDepartment?.departmentId,
            departmentHeadId: AdminCubit.get(context).headDepartmentId);
      }
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      ClearCubit.get(context).defaultDepartment();
      ClearCubit.get(context).defaultUserType();
    }
  }

  Future<void> deleteFileOnTap({required BuildContext context , required int index})async{
    deleteFile(
      fileId: filesList[index].fileId ?? '',
    ).then((value) {
      filesList.clear();
    }).whenComplete(() {
      CacheHelper.getData(key: spUserType) == userTypeAdmin && isSelectRange == false ? getFiles(
        yearId: selectedYears?.academicYearsId,
        termId: selectedAcademicTerm?.academicTermsId,
        departmentId: selectedDepartment?.departmentId,
        categoryId: selectedCategory?.categoryId,
        subCategoryId: selectedSubCategory?.subCategoryId,
        subjectId: selectedSubjectTerm?.subjectId,
      )
        : CacheHelper.getData(key: spUserType) == userTypeAdmin && isSelectRange == true ? getFilesRange(
        startYear: startRangeDateTime.year,
        endYear: endRangeDateTime.year,
        departmentId: selectedDepartment!.departmentId,
        categoryId: selectedCategory!.categoryId,
        subCategoryId: selectedSubCategory!.subCategoryId,
        subjectId: selectedSubjects!.subjectId,
      )
          : CacheHelper.getData(key: spUserType) == userTypeUser && isSelectRange == false ?
      getUserFiles(
        yearId: selectedYears?.academicYearsId,
        termId: selectedAcademicTerm?.academicTermsId,
        departmentId: selectedDepartment?.departmentId,
        categoryId: selectedCategory?.categoryId,
        subjectId: selectedUploadSubject?.subjectId,
        sectionId: selectedSection?.sectionId,
      )
          : null;
      Navigator.pop(context);
    });
  }

  Future<void> selectRangeButtonOnTap({required BuildContext context})async{
    if(startRangeDateTime == DateTime(-1)){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectStartYear, colorState: ColorState.error);
    }
    else if(endRangeDateTime == DateTime(-1)){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectEndYear, colorState: ColorState.error);
    }
    else if(selectedDepartment?.departmentId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectDepartment, colorState: ColorState.error);
    }
    else if(selectedCategory?.categoryId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectCategory, colorState: ColorState.error);
    }
    else if(selectedSubCategory?.subCategoryId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubCategory, colorState: ColorState.error);
    }
    else if (selectedCategory?.categoryNameEn == subjectModel
        && selectedSubjects!.subjectId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubject , colorState: ColorState.error);
    }
    else{
      getFilesRange(
        startYear: startRangeDateTime.year,
        endYear: endRangeDateTime.year,
        departmentId: selectedDepartment!.departmentId,
        categoryId: selectedCategory!.categoryId,
        subCategoryId: selectedSubCategory!.subCategoryId,
        subjectId: selectedSubjects!.subjectId,
      );
      isSelectRange = true;
      navigateTo(context, const ViewScreen());
    }
  }

  Future<void> selectButtonOnTap({required BuildContext context})async{
    if(selectedYears?.academicYearsId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectYear, colorState: ColorState.error);
    }
    else if(selectedAcademicTerm?.academicTermsId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectTerm, colorState: ColorState.error);
    }
    else if(selectedDepartment?.departmentId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectDepartment, colorState: ColorState.error);
    }
    else if(selectedCategory?.categoryId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectCategory, colorState: ColorState.error);
    }
    else if ((CacheHelper.getData(key: spUserType) == userTypeAdmin
        || CacheHelper.getData(key: spUserType) == userTypeHeadDepartment) && selectedSubCategory!.subCategoryId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubCategory , colorState: ColorState.error);
    }
    else if ((CacheHelper.getData(key: spUserType) == userTypeAdmin
        || CacheHelper.getData(key: spUserType) == userTypeHeadDepartment)
        && selectedCategory?.categoryNameEn == subjectModel
        && selectedSubjectTerm!.subjectTermId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubject , colorState: ColorState.error);
    }
    else if ((CacheHelper.getData(key: spUserType) == userTypeUser) && selectedUploadSubject!.subjectTermId == '-1'){
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubject , colorState: ColorState.error);
    }
    else {
      if (CacheHelper.getData(key: spUserType) == userTypeUser) {
        getUserFiles(
          sectionId: selectedSection?.sectionId,
          yearId: selectedYears!.academicYearsId,
          termId: selectedAcademicTerm!.academicTermsId,
          departmentId: selectedDepartment!.departmentId,
          categoryId: selectedCategory!.categoryId,
          subjectId: selectedUploadSubject!.subjectId,
        );
      }
      else {
        getFiles(
          yearId: selectedYears!.academicYearsId,
          termId: selectedAcademicTerm!.academicTermsId,
          departmentId: selectedDepartment!.departmentId,
          categoryId: selectedCategory!.categoryId,
          subCategoryId: selectedSubCategory!.subCategoryId,
          subjectId: selectedSubjectTerm!.subjectId,
        );
      }
      navigateTo(context, const ViewScreen());
    }
  }

  Future<void> uploadButtonOnTap({required BuildContext context})async{
    if (selectedYears?.academicYearsId == '-1') {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectYear , colorState: ColorState.error);
    }
    else if (selectedAcademicTerm?.academicTermsId == '-1') {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectTerm , colorState: ColorState.error);
    }
    else if (selectedDepartment?.departmentId == '-1') {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectDepartment , colorState: ColorState.error);
    }
    else if (selectedCategory?.categoryId == '-1') {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectCategory , colorState: ColorState.error);
    }
    else if ((CacheHelper.getData(key: spUserType) == userTypeUser
        || CacheHelper.getData(key: spUserType) == userTypeHeadDepartment)
        && selectedSubCategoryCoordinator?.subCategoryId == '-1') {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubCategory , colorState: ColorState.error);
    }
    else if (CacheHelper.getData(key: spUserType) == userTypeAdmin
        && selectedSubCategory?.subCategoryId == '-1') {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubCategory , colorState: ColorState.error);
    }
    else if (CacheHelper.getData(key: spUserType) == userTypeAdmin
        && selectedSubjectTerm?.subjectTermId == '-1') {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubject , colorState: ColorState.error);
    }
    else if ((CacheHelper.getData(key: spUserType) == userTypeUser
        || CacheHelper.getData(key: spUserType) == userTypeHeadDepartment)
        && selectedUploadSubject?.subjectId == '-1') {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectSubject , colorState: ColorState.error);
    }
    else if (UploadCubit.get(context).fileSize == 0) {
      showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectFile , colorState: ColorState.error);
    }
    else {
      Uuid id = const Uuid();
      String fileId = id.v1();
      UploadCubit.get(context).uploadFile(
        subjectNameAr: CacheHelper.getData(key: spUserType) == userTypeAdmin ? selectedSubjectTerm
            ?.subjectNameAr : selectedUploadSubject?.subjectNameAr,
        subjectNameEn: CacheHelper.getData(key: spUserType) == userTypeAdmin ? selectedSubjectTerm
            ?.subjectNameEn : selectedUploadSubject?.subjectNameEn,
        termNameAr: selectedAcademicTerm?.academicTermsNameAr,
        termNameEn: selectedAcademicTerm?.academicTermsNameEn,
        yearName: selectedYears?.academicYearsNumber.join('/').toString(),
        subCategoryId: CacheHelper.getData(key: spUserType) == userTypeAdmin ?
        selectedSubCategory?.subCategoryId
            : selectedSubCategoryCoordinator!.subCategoryId,
        fileYear: selectedYears!.academicYearsId,
        fileTerm: selectedAcademicTerm!.academicTermsId,
        subCategoryNameAr: CacheHelper.getData(key: spUserType) == userTypeAdmin ?
        selectedSubCategory!.subCategoryNameAr.first
            : selectedSubCategoryCoordinator?.subCategoryNameAr.first,
        subCategoryNameEn: CacheHelper.getData(key: spUserType) == userTypeAdmin ?
        selectedSubCategory!.subCategoryNameEn.first
            : selectedSubCategoryCoordinator?.subCategoryNameEn.first,
        categoryNameAr: selectedCategory!.categoryNameAr,
        categoryNameEn: selectedCategory!.categoryNameEn,
        sectionId: selectedSection!.sectionId,
        categoryId: selectedCategory!.categoryId,
        fileId: fileId,
        sectionNameAr: selectedSection!.sectionNameAr,
        sectionNameEn: selectedSection!.sectionNameEn,
        departmentId: selectedDepartment!.departmentId,
        subjectId: CacheHelper.getData(key: spUserType) == userTypeAdmin
            ? selectedSubjectTerm?.subjectId
            : selectedUploadSubject?.subjectId,
      );
      ClearCubit.get(context).clearDialog();
      UploadCubit.get(context).fileSize = 0;
    }
  }


}
