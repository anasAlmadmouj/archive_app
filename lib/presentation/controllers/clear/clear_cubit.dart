import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:archive_app/presentation/controllers/clear/clear_state.dart';

class ClearCubit extends Cubit<ClearState> {
  final AppCubit appCubit;

  ClearCubit(BuildContext context)
      : appCubit = AppCubit.get(context),
        super(ClearInitial());

  static ClearCubit get(BuildContext context) => BlocProvider.of<ClearCubit>(context);

  void clearDialog() {
    defaultSubCategoryCoordinator();
    defaultAcademicYear();
    defaultAcademicTerm();
    appCubit.academicTermsList.clear();
    defaultDepartment();
    defaultCategory();
    defaultSubCategory();
    appCubit.subjectList.clear();
    defaultSubjectTerm();
    defaultUploadSubject();
    appCubit.uniqueSubjectList.clear();
    appCubit.subjectsList.clear();
    appCubit.sectionIdList.clear();
    defaultSection();
    appCubit.sectionList.clear();

    emit(ClearDialogSuccessState());
  }

  void changeDepartmentClear() {
    defaultCategory();
    defaultSubCategory();
    appCubit.subCategoryList.clear();
    defaultSubjectTerm();
    defaultUploadSubject();
    appCubit.uniqueSubjectList.clear();
    defaultSection();
    appCubit.sectionList.clear();
    emit(ChangeDepartmentClearState());
  }

  void changeSubjectClear() {
    defaultSection();
    appCubit.sectionList.clear();
    defaultSubCategoryCoordinator();
    emit(ChangeSubjectClearState());
  }

  void defaultAcademicTerm() {
    appCubit.selectedAcademicTerm = AcademicTermsModel(
      academicTermsId: '-1',
      academicTermsNameAr: 'الفصل الدراسي',
      academicTermsNameEn: 'Academic Term',
      academicYearsId: '-1',
    );
    emit(DefaultAcademicTermState());
  }

  void defaultAcademicYear() {
    appCubit.selectedYears = AcademicYearsModel(
      academicYearsNumber: [-1],
      academicYearsId: '-1',
    );
    emit(DefaultAcademicYearState());
  }

  void defaultCategory() {
    appCubit.selectedCategory = CategoryModel(
        departmentId: '-1',
        categoryId: '-1',
        categoryNameAr: 'الفئة',
        categoryNameEn: 'Category');
    emit(DefaultCategoryState());
  }

  void defaultDepartment() {
    appCubit.selectedDepartment = DepartmentModel(
      departmentId: '-1',
      departmentNameAr: 'القسم',
      departmentNameEn: 'Department',
      departmentHeadId: '-1',
    );
    emit(DefaultDepartmentState());
  }

  void defaultSection() {
    appCubit.selectedSection = SectionModel(
        sectionId: '-1',
        sectionNameAr: 'الشعبة',
        sectionNameEn: 'Section',
        userId: '-1',
        subjectId: '-1');
    emit(DefaultSectionState());
  }

  void defaultSubCategory() {
    appCubit.selectedSubCategory = SubCategoryModel(
      categoryId: '-1',
      subCategoryNameAr: ['الفئة الفرعية'],
      subCategoryNameEn: ['Sub Category'],
      subCategoryId: '-1',
    );
    emit(DefaultSubCategoryState());
  }

  void defaultSubjects() {
    appCubit.selectedSubjects = SubjectsModel(
      departmentId: '-1',
      subjectNameAr: 'المادة',
      subjectNameEn: 'Subject',
      numberSubject: '-1',
      subjectId: '-1',
    );
    emit(DefaultSubjectsState());
  }

  void defaultSubjectTerm() {
    appCubit.selectedSubjectTerm = SubjectTermModel(
      departmentId: '-1',
      subjectNameAr: 'المادة',
      subjectNameEn: 'Subject',
      subjectTermId: '-1',
      subjectId: '-1',
      academicTermId: '-1',
      subjectCoordinator: '-1',
      subjectNumber: '-1',
    );
    emit(DefaultSubjectTermState());
  }

  void defaultUserSubject() {
    appCubit.selectedUserSubject = UsersModel(
      departmentId: '-1',
      userName: 'User',
      userEmail: '',
      userTypeId: '-1',
      userId: '-1',
    );
    emit(DefaultUserSubjectState());
  }

  void defaultSubCategoryCoordinator() {
    appCubit.selectedSubCategoryCoordinator = SubCategoryModel(
      categoryId: '-1',
      subCategoryNameAr: ['الفئة الفرعية'],
      subCategoryNameEn: ['Sub Category'],
      subCategoryId: '-1',
    );
    emit(DefaultSubCategoryCoordinatorState());
  }

  void defaultUserType() {
    appCubit.selectedUserType = UserTypeModel(
      userTypeId: '-1',
      userTypeName: 'User Type',
    );
    emit(DefaultUserTypeState());
  }

  defaultUploadSubject() {
    appCubit.selectedUploadSubject = SubjectTermModel(
      academicTermId: '-1',
      subjectCoordinator: '-1',
      subjectId: '-1',
      subjectTermId: '-1',
      departmentId: '-1',
      subjectNameEn: 'Subject',
      subjectNameAr: 'المادة',
      subjectNumber: '-1',
    );
    emit(DefaultUploadSubjectState());
  }
}
