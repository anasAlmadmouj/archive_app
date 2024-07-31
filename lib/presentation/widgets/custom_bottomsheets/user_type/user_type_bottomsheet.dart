import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class UserTypeBottomSheet extends StatelessWidget {
  final void Function(int)? onTap;
  const UserTypeBottomSheet({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        List<UserTypeModel> list = AppCubit.get(context).userTypeList;
        return CustomBottomSheet(
            itemCount: list.length,
            isHasData: list.isNotEmpty,
            hintText: appCubit.selectedUserType?.userTypeId == '-1'
                ? AppLocalizations.of(context)!.userType
                : appCubit.selectedUserType?.userTypeName ?? '',
            title: appCubit.userTypeList
                .map((e) => e.userTypeName)
                .toList(),
            onTap: onTap
        );
      },
    );
  }
}