import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:archive_app/presentation/widgets/bottomsheet/custom_bottomsheet.dart';

class SectionBottomSheet extends StatelessWidget {
  final bool isValid;
  final bool isHasData;
  final void Function(int)? onTap;
  const SectionBottomSheet({
    super.key, this.isValid = true, this.onTap, this.isHasData = true,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        List<SectionModel> list = AppCubit.get(context).sectionList;
        return CustomBottomSheet(
            isValid: isValid,
            isHasData: isHasData,
            itemCount: list.length,
            hintText: appCubit.selectedSection?.sectionId == '-1'
                ? AppLocalizations.of(context)!.section
                : appCubit.selectedSection?.getTitle(context) ?? '',
            title: appCubit.sectionList
                .map((e) => e.getTitle(context))
                .toList(),
            onTap: onTap
        );
      },
    );
  }
}