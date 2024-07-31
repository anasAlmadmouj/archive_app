import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddSectionScreen extends StatelessWidget {
   AddSectionScreen({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    AdminCubit adminCubit = AdminCubit.get(context);
    ClearCubit clearCubit = ClearCubit.get(context);
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is AddSectionSuccessState) {
          appCubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.addNewSectionSuccess , colorState: ColorState.success);
        }
        if (state is AddSectionErrorState) {
          appCubit.showSnackBar(context: context, title: state.error , colorState: ColorState.error);
        }
      },
      builder: (context, state) {
        return BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            return WillPopScope(
                onWillPop: () async {
              return false;
            },
             child: Form(
              key: formKey,
              child: Scaffold(
                appBar: customizedAppBar(
                  context: context,
                  function: () {
                    clearCubit.defaultAcademicYear();
                    clearCubit.defaultAcademicTerm();
                    clearCubit.defaultDepartment();
                    clearCubit.defaultSubjectTerm();
                    clearCubit.defaultSection();
                    AdminCubit.get(context).defaultUsers();
                    Navigator.pop(context);
                  },
                  title: AppLocalizations.of(context)!.addNewSection,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const LogoAddingPages(),
                        10.height,
                         YearsBottomSheet(
                          onTap: (index) => appCubit.yearsSectionOnTap(index: index, context: context),
                        ),
                        10.height,
                        TermsDialog(
                          isValid: appCubit.termsIsValid,
                          onTap: (index) => appCubit.termsSubjectOnTap(index: index, context: context),
                        ),
                        10.height,
                        DepartmentBottomSheet(
                          isValid: appCubit.departmentValid,
                          onTap: (index) => appCubit.departmentSubjectTermOnTap(index: index, context: context),
                        ),
                        10.height,
                        SubjectBottomSheet(
                          isValid: appCubit.isSubjectValid,
                          isHasData: appCubit.isSubjectHasData,
                          onTap: (index) => appCubit.subjectSectionOnTap(index: index, context: context),
                        ),
                        10.height,
                        SectionBottomSheet(
                          isHasData: appCubit.isSectionHaseData,
                          isValid: appCubit.isSectionValid,
                          onTap: (index) => appCubit.sectionOnTap(index: index, context: context),
                        ),
                        10.height,
                        UsersBottomSheet(
                          onTap: (index) => adminCubit.usersOnTap(index: index, context: context),
                        ),
                        30.height,
                        ConditionalBuilder(
                          condition: state is! AddSectionLoadingState,
                          builder: (context) =>
                              AddingButton(text: AppLocalizations.of(context)!.add, onTap: (){
                                appCubit.addSectionButtonOnTap(formKey: formKey, context: context);
                              }),
                          fallback: (context) =>
                          const CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            );
          },
        );
      },
    );
  }
}
