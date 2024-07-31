import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:archive_app/presentation/widgets/bottomsheet/custom_bottomsheet.dart';

class SubjectBottomSheet extends StatelessWidget {
  final bool isValid;
  final bool isHasData;
  final void Function(int)? onTap;
  const SubjectBottomSheet({
    super.key, this.isValid = true, this.onTap, this.isHasData = true,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {

        List<SubjectTermModel> list = AppCubit.get(context).subjectTermList;
        return CustomBottomSheet(
            isValid: isValid,
            isHasData: isHasData,
            itemCount: list.length,
            hintText: appCubit.selectedSubjectTerm?.subjectTermId == '-1'
                ? AppLocalizations.of(context)!.subject
                : appCubit.selectedSubjectTerm?.getTitle(context) ?? '',
            title: appCubit.subjectTermList
                .map((e) => e.getTitle(context))
                .toList(),
            onTap: onTap
        );
      },
    );
  }
}