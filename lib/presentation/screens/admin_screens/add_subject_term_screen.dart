import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddSubjectTermScreen extends StatelessWidget {
  AddSubjectTermScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    ClearCubit clearCubit = ClearCubit.get(context);
    return WillPopScope(
        onWillPop: () async {
      return false;
    },
     child: Form(
      key: formKey,
      child: BlocConsumer<AdminCubit, AdminStates>(
        listener: (context, adminState) {
          if (adminState is AddSubjectSuccessState) {
            appCubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.addNewSubjectSuccess , colorState: ColorState.success);
          }
          if (adminState is AddSubjectErrorState) {
            appCubit.showSnackBar(context: context, title: adminState.error , colorState: ColorState.error);
          }
        },
        builder: (context, adminState) {
          return BlocBuilder<AppCubit, AppStates>(
  builder: (context, state) {
    return Scaffold(
            appBar: customizedAppBar(
              context: context,
              function: () {
                clearCubit.defaultAcademicYear();
                clearCubit.defaultAcademicTerm();
                clearCubit.defaultDepartment();
                clearCubit.defaultSubjects();
                Navigator.pop(context);
              },
              title: AppLocalizations.of(context)!.addNewSubject,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const LogoAddingPages(),
                  10.height,
                  YearsBottomSheet(
                  onTap: (index) => appCubit.yearsSubjectOnTap(index: index, context: context),
                ),
                  10.height,
                  TermsDialog(
                    isValid: appCubit.termsIsValid,
                    onTap: (index) => appCubit.termsSelectOnTap(index: index, context: context),
                  ),
                  10.height,
                  DepartmentBottomSheet(
                    isValid: appCubit.departmentValid,
                    onTap: (index) => appCubit.departmentSubjectsOnTap(index: index, context: context),
                  ),
                  10.height,
                  AllSubjectBottomSheet(
                    isValid: appCubit.isAllSubjectsValid,
                    isHasData: appCubit.isAllSubjectsHasData,
                    onTap: (index) => appCubit.allSubjectsOnTap(index: index, context: context),
                  ),
                  10.height,
                  const NumberSectionBottomSheet(),
                  const Spacer(),
                  adminState is AddSubjectLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : AddingButton(text: AppLocalizations.of(context)!.add, onTap: () {
                        appCubit.addSubjectTermButtonOnTap(formKey: formKey, context: context);
                  }),
                ],
              ),
            ),
          );
  },
);
        },
      ),
    ),
    );
  }
}

