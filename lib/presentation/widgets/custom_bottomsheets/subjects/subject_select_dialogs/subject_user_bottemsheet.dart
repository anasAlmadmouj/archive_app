import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:archive_app/presentation/widgets/bottomsheet/upload_custom_bottomsheet.dart';

class SubjectUserBottomSheet extends StatelessWidget {
  const SubjectUserBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return UploadCustomBottomSheet(
          isAdmin: CacheHelper.getData(key: spUserType) == userTypeUser,
          isValid: cubit.adminUserSubjectValid,
          adminIsHasData: cubit.adminUserSubjectHaseData,
          isHasData: cubit.isSubjectHasData,
          adminIsValid: cubit.adminUserSubjectValid,
          adminOnTap: (index) => cubit.adminSubjectUserOnTap(index: index, context: context),
          onTap: (index) => cubit.subjectUserOnTap(index: index, context: context),
          hintText: cubit.selectedSubjectTerm?.subjectTermId == '-1'
              ? AppLocalizations.of(context)!.subject
              : cubit.selectedSubjectTerm?.getTitle(context) ?? '',
          title: cubit.subjectTermList
              .map((e) => e.getTitle(context))
              .toList(),
          itemCount: cubit.subjectTermList.length,
          adminTitle: cubit.uniqueSubjectList
              .map((e) => e.getTitle(context))
              .toList(),
          adminItemCount: cubit.uniqueSubjectList.length,
        );
      },
    );
  }
}
