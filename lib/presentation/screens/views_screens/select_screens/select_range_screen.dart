import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class SelectRangeScreen extends StatelessWidget {
  const SelectRangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      return false;
    },
     child: BlocBuilder<AppCubit, AppStates>(
  builder: (context, state) {
    AppCubit appCubit = AppCubit.get(context);
    ClearCubit clearCubit = ClearCubit.get(context);
    return Scaffold(
      appBar: customizedAppBar(
        context: context,
        function: () {
          clearCubit.defaultAcademicYear();
          clearCubit.defaultAcademicTerm();
          clearCubit.defaultDepartment();
          clearCubit.defaultCategory();
          clearCubit.defaultSubCategory();
          appCubit.startRangeDateTime = DateTime(-1);
          appCubit.endRangeDateTime = DateTime(-1);
          pop(context);
        },
        title: AppLocalizations.of(context)!.viewDataWithRange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const StartYearRangeDialog(), // start year
            15.height,
            const EndYearRangeDialog(),   // end year
            15.height,
            DepartmentBottomSheet(
              onTap: (index) => appCubit.departmentOnTap(index: index, context: context),
            ),
            15.height,
            CategoryBottomSheet(
              onTap: (index) => appCubit.categorySelectRangeOnTap(index: index, context: context),
            ),
            15.height,
            SubCategoryBottomSheet(
              isValid: appCubit.subCategoryValid,
              onTap: (index) => appCubit.subCategoryOnTap(index: index, context: context),
            ),
            if(AppCubit.get(context).selectedCategory?.categoryNameEn == subjectModel)
              Column(
                children: [
                  15.height,
                  AllSubjectBottomSheet(
                    isHasData: appCubit.isAllSubjectsHasData,
                    onTap: (index) => appCubit.allSubjectsOnTap(index: index, context: context),
                  ),
                ],
              ),
            Spacer(),
            AddingButton(
              icon: Icons.search,
              text: AppLocalizations.of(context)!.search,
              onTap: () {
                appCubit.selectRangeButtonOnTap(context: context);
              },),
          ],
        ),
      ),
    );
  },
),
    );
  }
}
