import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class UploadScreenMobile extends StatelessWidget {

  const UploadScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    ClearCubit clearCubit = ClearCubit.get(context);
    return BlocConsumer<UploadCubit, UploadStates>(
      listener: (context, uploadState) {
        if (uploadState is UploadSuccessState) {
          appCubit.showSnackBar(
              context: context,
              title: AppLocalizations.of(context)!.uploadSuccess,
              colorState: ColorState.success);
        }
        if (uploadState is UploadErrorState) {
          appCubit.showSnackBar(context: context, title: uploadState.error , colorState: ColorState.error);
        }
      },
      builder: (context, uploadState) {
        return WillPopScope(
            onWillPop: () async {
          return false;
        },
         child: Scaffold(
          appBar: customizedAppBar(
            context: context,
            function: () {
              clearCubit.clearDialog();
              UploadCubit.get(context).fileSize = 0;
              pop(context);
            },
            title: AppLocalizations.of(context)!.uploadFile,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                YearsBottomSheet(
                  onTap: (index) => appCubit.yearsUploadOnTap(index: index, context: context),
                ), //year
                15.height,
                TermsDialog(
                  isValid: appCubit.termsIsValid,
                  onTap:(index)=> appCubit.uploadTermsOnTap(index: index, context: context),
                ), //term
                15.height,
                DepartmentBottomSheet(
                  isValid: appCubit.departmentValid,
                  onTap: (index) => appCubit.departmentSubjectsOnTap(index: index, context: context),
                ),
                15.height,
                CategoryBottomSheet(
                  onTap: (index) => appCubit.categoryUploadOnTap(index: index, context: context),
                ), //category
                15.height,
                if (appCubit.selectedCategory!.categoryNameEn == subjectModel)
                  Column(
                    children: [
                      const UploadSubjectBottomSheet(),
                      15.height,
                    ],
                  ),
                SubCategoryBottomSheet(
                  isValid: appCubit.subCategoryValid,
                  onTap: (index) => appCubit.subCategoryUploadOnTap(index: index, context: context),
                ), //SubCategory
                15.height,
                if((CacheHelper.getData(key: spUserType) ==
                    userTypeUser ||
                    CacheHelper.getData(key: spUserType) ==
                        userTypeHeadDepartment)
                    && appCubit.selectedCategory?.categoryNameEn == subjectModel
                    && !listEquals(appCubit.selectedSubCategoryCoordinator
                        ?.subCategoryNameAr,
                        ['تنفيذ وتقييم اداء الطلبة'])
                    && appCubit.selectedSubCategoryCoordinator?.subCategoryId != '-1')
                  Column(
                    children: [
                      const UploadSectionBottomSheet(),
                      15.height,
                    ],
                  ),
                if((CacheHelper.getData(key: spUserType) ==
                    userTypeAdmin)
                    && appCubit
                        .selectedCategory?.categoryNameEn == subjectModel
                    && !listEquals(appCubit.selectedSubCategory?.subCategoryNameAr, ['تنفيذ وتقييم اداء الطلبة'])
                    && appCubit.selectedSubCategory?.subCategoryId != '-1')
                  const Column(
                    children: [
                      UploadSectionBottomSheet(),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                //SubCategory
                UploadCubit.get(context).fileSize != 0
                    ? Column(
                  children: [
                    10.height,
                    const FileChooseContainer(),
                  ],
                )
                    : const SizedBox(),
                15.height,
                AddingButton(
                  text: AppLocalizations.of(context)!.chooseFile,
                  onTap: () {
                    UploadCubit.get(context).selectPdfFile();
                  },
                ),

                10.height,
                uploadState is UploadLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : AddingButton(
                  icon: Icons.upload,
                  text: AppLocalizations.of(context)!.uploadFile,
                  onTap: () {
                    appCubit.uploadButtonOnTap(context: context);
                  },
                ),
              ],
            ),
          ),
        ),
        );
      },
    );
  }
}

