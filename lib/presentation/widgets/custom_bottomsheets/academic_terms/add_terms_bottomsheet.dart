import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddTermsBottomSheet extends StatelessWidget {
  final void Function(int)? onTap;
  const AddTermsBottomSheet({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {

        List<String> list = AppCubit.get(context).listTermsDropDown(context);
        return CustomBottomSheet(
            isHasData: list.isNotEmpty,
            itemCount: list.length,
            hintText: appCubit.selectedAcademicValue ??
                AppLocalizations.of(context)!.academicTerm,
            title: list
                .map((e) => e)
                .toList(),
            onTap: (index) => appCubit.addTermsOnTap(index: index, context: context,)
        );
      },
    );
  }
}

