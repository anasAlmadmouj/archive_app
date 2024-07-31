import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:archive_app/presentation/widgets/bottomsheet/upload_custom_bottomsheet.dart';

class UploadSectionBottomSheet extends StatelessWidget {
  const UploadSectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return UploadCustomBottomSheet(
          isValid: cubit.isUploadSectionValid,
          adminIsHasData: cubit.isSectionHaseData,
          isHasData: cubit.isSectionHaseData,
          adminIsValid: cubit.isSectionValid,
          adminOnTap: (index) => cubit.sectionOnTap(index: index, context: context),
          onTap: (index) => cubit.sectionOnTap(index: index, context: context),
          hintText: cubit.selectedSection?.sectionId == '-1'
              ? AppLocalizations.of(context)!.section
              : cubit.selectedSection?.getTitle(context) ?? '',
          title: cubit.sectionList
              .map((e) => e.getTitle(context))
              .toList(),
          itemCount: cubit.sectionList.length,
          adminTitle: cubit.sectionList
              .map((e) => e.getTitle(context))
              .toList(),
          adminItemCount: cubit.sectionList.length,
        );
      },
    );
  }
}
