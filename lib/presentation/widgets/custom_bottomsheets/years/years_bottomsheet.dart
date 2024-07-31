import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class YearsBottomSheet extends StatelessWidget {
  final void Function(int)? onTap;
  const YearsBottomSheet({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {

        List<AcademicYearsModel> list = AppCubit.get(context).academicYearsList;
        return CustomBottomSheet(
            itemCount: list.length,
            isHasData: appCubit.academicYearsList.isNotEmpty,
            hintText: appCubit.selectedYears?.academicYearsId == '-1'
                ? AppLocalizations.of(context)!.academicYear
                : appCubit.selectedYears!.academicYearsNumber.join('/'.toString()),
            title: appCubit.academicYearsList
                .map((e) => e.academicYearsNumber.join('/').toString())
                .toList(),
            onTap: onTap
        );
      },
    );
  }
}