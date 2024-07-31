import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class TermsDialog extends StatelessWidget {
  final bool isValid;
  final void Function(int)? onTap;
  const TermsDialog({
    super.key, this.isValid = true, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {

        List<AcademicTermsModel> list = AppCubit.get(context).academicTermsList;
        return CustomBottomSheet(
          isValid: isValid,
          isHasData: appCubit.academicTermsList.isNotEmpty,
          itemCount: list.length,
          hintText: appCubit.selectedAcademicTerm?.academicTermsId == '-1'
              ? AppLocalizations.of(context)!.academicTerm
              : appCubit.selectedAcademicTerm?.getTitle(context) ?? '',
          title: appCubit.academicTermsList
              .map((e) => e.getTitle(context))
              .toList(),
          onTap: onTap
        );
      },
    );
  }
}

// TextFieldDialog(
// hintText: appCubit.selectedAcademicTerm?.academicTermsId == '-1'
// ? AppLocalizations.of(context)!.academicTerm
//     : appCubit.selectedAcademicTerm?.academicTermsNameAr ?? '',
// onTap: () {
// if (appCubit.selectedYears?.academicYearsId == '-1') {
// appCubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectYear,  colorState: ColorState.error);
// }
// else {
// showCustomDropDownDialog(
// context: context,
// title: AppLocalizations.of(context)!.academicTerm,
// iconFunction: () {
// appCubit.changeAcademicTermClear();
// maybePop(context);
// },
// child: CustomDropDownDialog(
// actionDropDownList: appCubit
//     .academicTermsList
//     .map((terms) =>
// ListDialog(
// isSelected: (appCubit.selectedAcademicTerm
//     ?.academicTermsId ?? '') == terms.academicTermsId
// ? true : false,
// title: currentLocale.languageCode == 'ar' ? terms.academicTermsNameAr ?? '' : terms.academicTermsNameEn ?? '',
// onTap: () {
// appCubit.changeAcademicTerms(academicTermsModel: terms);
// appCubit.defaultDepartment();
// appCubit.defaultCategory();
// if(CacheHelper.getData(key: spUserType) == userTypeAdmin){
// appCubit.defaultSubCategory();
// }
// else {
// appCubit.defaultSubCategoryCoordinator();
// }
// },
// ))
//     .toList(),
// ),
// );
// }
// },
// );
