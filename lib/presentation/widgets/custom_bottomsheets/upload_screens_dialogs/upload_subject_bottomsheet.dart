import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:archive_app/presentation/widgets/bottomsheet/upload_custom_bottomsheet.dart';

class UploadSubjectBottomSheet extends StatelessWidget {
  const UploadSubjectBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return UploadCustomBottomSheet(
            isValid: cubit.isSubjectValid,
            adminIsHasData: cubit.isSubjectHasData,
            isHasData: cubit.isSubjectUploadHasData,
            adminIsValid: cubit.isSubjectValid,
            adminOnTap: (index) => cubit.adminUploadSubjectOnTap(index: index, context: context),
            onTap: (index) => cubit.uploadSubjectOnTap(index: index, context: context),
            hintText: cubit.selectedSubjectTerm?.subjectTermId == '-1'
                ? AppLocalizations.of(context)!.subject
                : cubit.selectedSubjectTerm?.getTitle(context) ?? '',
            title: cubit.uniqueSubjectList
                .map((e) => e.getTitle(context))
                .toList(),
            itemCount: cubit.uniqueSubjectList.length,
            adminTitle: cubit.subjectTermList
                .map((e) => e.getTitle(context))
                .toList(),
            adminItemCount: cubit.subjectTermList.length,
        );
      },
    );
  }
}
