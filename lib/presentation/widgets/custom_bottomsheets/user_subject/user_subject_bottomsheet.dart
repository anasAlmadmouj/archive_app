import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class UserSubjectBottomSheet extends StatelessWidget {
  final bool isValid;
  final void Function(int)? onTap;
  const UserSubjectBottomSheet({
    super.key, this.isValid = true, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        List<UsersModel> list = AppCubit.get(context).userSubjectList;
        return CustomBottomSheet(
            isValid: appCubit.isUserSubjectValid,
            itemCount: list.length,
            hintText: appCubit.selectedUserSubject?.userId == '-1'
                ? AppLocalizations.of(context)!.users
                : appCubit.selectedUserSubject?.userName ?? '',
            title: list
                .map((e) => e.userName)
                .toList(),
            onTap: onTap,
            isHasData: appCubit.isUserSubjectHaseData,
        );
      },
    );
  }
}