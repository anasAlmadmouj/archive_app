import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class SubCategoryBottomSheet extends StatelessWidget {
  final bool isValid;
  final void Function(int)? onTap;
  const SubCategoryBottomSheet({
    super.key, this.isValid = true, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {

        List<SubCategoryModel> list = AppCubit.get(context).subCategoryList;
        return CustomBottomSheet(
            isValid: isValid,
            isHasData: appCubit.subCategoryList.isNotEmpty,
            paddingTitle: 24.0,
            itemCount: list.length,
            hintText: appCubit.selectedSubCategory?.subCategoryId == '-1'
                ? AppLocalizations.of(context)!.subCategory
                : appCubit.selectedSubCategory?.getTitle(context) ?? '',
            title: appCubit.subCategoryList
                .map((e) => e.getTitle(context))
                .toList(),
            onTap: onTap
        );
      },
    );
  }
}