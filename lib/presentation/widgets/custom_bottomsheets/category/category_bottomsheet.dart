import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class CategoryBottomSheet extends StatelessWidget {
  final void Function(int)? onTap;
  const CategoryBottomSheet({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        List<CategoryModel> list = AppCubit.get(context).categoryList;
        return CustomBottomSheet(
            itemCount: list.length,
            isHasData: appCubit.categoryList.isNotEmpty,
            hintText: appCubit.selectedCategory?.categoryId == '-1'
                ? AppLocalizations.of(context)!.category
                : appCubit.selectedCategory?.getTitle(context) ?? '',
            title: appCubit.categoryList
                .map((e) => e.getTitle(context))
                .toList(),
            onTap: onTap,
        );
      },
    );
  }
}