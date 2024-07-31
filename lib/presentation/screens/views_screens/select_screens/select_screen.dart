import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    ClearCubit clearCubit = ClearCubit.get(context);
    return WillPopScope(
        onWillPop: () async {
      return false;
    },
     child: BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: customizedAppBar(
            context: context,
            function: () {
              clearCubit.defaultAcademicYear();
              clearCubit.defaultAcademicTerm();
              clearCubit.defaultDepartment();
              clearCubit.defaultCategory();
              clearCubit.defaultSubCategory();
              clearCubit.defaultSubjectTerm();
              AppCubit.get(context).subjectList.clear();
              AppCubit.get(context).uniqueSubjectList.clear();
              AppCubit.get(context).sectionIdList.clear();
              pop(context);
            },
            title: AppLocalizations.of(context)!.viewData,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                YearsBottomSheet(
                  onTap: (index) => appCubit.yearsSelectOnTap(index: index, context: context),
                ), //year
                15.height,
              TermsDialog(
                isValid: appCubit.termsIsValid,
                onTap: (index) => appCubit.termsSelectOnTap(index: index, context: context),
              ),
                15.height,
                DepartmentBottomSheet(
                  onTap: (index) => appCubit.departmentOnTap(index: index, context: context),
                ),
                15.height,
                CategoryBottomSheet(
                  onTap: (index) => appCubit.categorySelectOnTap(index: index, context: context),
                ),
                if(CacheHelper.getData(key: spUserType) == userTypeAdmin
                    || CacheHelper.getData(key: spUserType) == userTypeHeadDepartment)
                 Column(
                  children: [
                    15.height,
                    SubCategoryBottomSheet(
                      isValid: appCubit.subCategoryValid,
                      onTap: (index) => appCubit.subCategoryOnTap(index: index, context: context),
                    ),
                  ],
                ),
                if (appCubit.selectedCategory?.categoryNameEn == subjectModel)
                  Column(
                    children: [
                      if(CacheHelper.getData(key: spUserType) == userTypeAdmin
                          || CacheHelper.getData(key: spUserType) == userTypeHeadDepartment)
                        Column(
                          children: [
                            15.height,
                            SubjectBottomSheet(
                              isValid: appCubit.isSubjectValid,
                              isHasData: appCubit.isSubjectHasData,
                              onTap: (index) => appCubit.subjectCoordinatorOnTap(index: index, context: context),
                            ),
                          ],
                        ),

                      if(CacheHelper.getData(key: spUserType) == userTypeUser)
                        Column(
                          children:[
                            15.height,
                            const SubjectUserBottomSheet(),
                          ],
                        ),

                    ],
                  ),
                if (CacheHelper.getData(key: spUserType) == userTypeUser &&
                    appCubit.selectedCategory?.categoryNameEn == subjectModel)
                  Column(
                    children: [
                      15.height,
                      SectionBottomSheet(
                        isHasData: appCubit.isSectionHaseData,
                        onTap: (index) => appCubit.sectionOnTap(index: index, context: context),
                      ),
                    ],
                  ),
                Spacer(),
                AddingButton(
                  icon: Icons.search,
                    text: AppLocalizations.of(context)!.search,
                    onTap: () {
                      appCubit.selectButtonOnTap(context: context);
                    },
                ),
              ],
            ),
          ),
        );
      },
    ),
    );
  }
}

