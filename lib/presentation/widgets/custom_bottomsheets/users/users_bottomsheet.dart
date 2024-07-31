import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class UsersBottomSheet extends StatelessWidget {
  final bool isValid;
  final void Function(int)? onTap;
  final String? hintText;
  const UsersBottomSheet({
    super.key, this.isValid = true, this.onTap, this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    AdminCubit adminCubit = AdminCubit.get(context);
    return BlocBuilder<AdminCubit, AdminStates>(
      builder: (context, state) {
        List<UsersModel> list = adminCubit.userList;
        return CustomBottomSheet(
            isValid: isValid,
            isHasData: list.isNotEmpty,
            itemCount: list.length,
            hintText: adminCubit.selectedUsers?.userId == '-1'
                ? hintText ?? AppLocalizations.of(context)!.users
                : adminCubit.selectedUsers?.userName ?? '',
            title: adminCubit.userList
                .map((e) => e.userName)
                .toList(),
            onTap: onTap
        );
      },
    );
  }
}