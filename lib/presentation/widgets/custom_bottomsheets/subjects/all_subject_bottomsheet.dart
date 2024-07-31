import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:archive_app/presentation/widgets/bottomsheet/custom_bottomsheet.dart';

class AllSubjectBottomSheet extends StatelessWidget {
  final bool isValid;
  final bool isHasData;
  final void Function(int)? onTap;
  const AllSubjectBottomSheet({
    super.key, this.isValid = true, this.onTap, this.isHasData = true,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        List<SubjectsModel> list = AppCubit.get(context).subjectsList;
        return CustomBottomSheet(
            isValid: isValid,
            isHasData: isHasData,
            itemCount: list.length,
            hintText: appCubit.selectedSubjects?.subjectId == '-1'
                ? AppLocalizations.of(context)!.subject
                : appCubit.selectedSubjects?.getTitle(context) ?? '',
            title: appCubit.subjectsList
                .map((e) => e.getTitle(context))
                .toList(),
            onTap: onTap
        );
      },
    );
  }
}