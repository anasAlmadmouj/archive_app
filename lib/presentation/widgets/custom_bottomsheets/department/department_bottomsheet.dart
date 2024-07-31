import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class DepartmentBottomSheet extends StatelessWidget {
  final bool isValid;
  final void Function(int)? onTap;
  const DepartmentBottomSheet({
    super.key, this.isValid = true, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        List<DepartmentModel?> list = AppCubit.get(context).departmentsList;
        return CustomBottomSheet(
            isValid: isValid,
            isHasData: appCubit.departmentsList.isNotEmpty,
            itemCount: list.length,
            hintText: appCubit.selectedDepartment?.departmentId == '-1'
                ? AppLocalizations.of(context)!.department
                : appCubit.selectedDepartment?.getTitle(context) ?? '',
            title: appCubit.departmentsList
                .map((e) => e!.getTitle(context))
                .toList(),
            onTap: onTap
        );
      },
    );
  }
}