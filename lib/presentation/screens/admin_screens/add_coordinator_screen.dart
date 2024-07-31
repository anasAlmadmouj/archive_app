import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddCoordinatorScreen extends StatelessWidget {
  AddCoordinatorScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    ClearCubit clearCubit = ClearCubit.get(context);
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, adminState) {
        if(adminState is CreateSubjectCoordinatorSuccessState){
          appCubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.addNewCategorySuccess , colorState: ColorState.success);
        }
        if(adminState is CreateSubjectCoordinatorErrorState){
          appCubit.showSnackBar(context: context, title: adminState.error , colorState: ColorState.error);
        }
      },
      builder: (context, adminState) {
        return WillPopScope(
            onWillPop: () async {
          return false;
        },
         child: Form(
          key: formKey,
          child: BlocBuilder<AppCubit, AppStates>(
  builder: (context, state) {
    return Scaffold(
            appBar: customizedAppBar(
              context: context,
              function: () {
                clearCubit.defaultAcademicYear();
                clearCubit.defaultAcademicTerm();
                clearCubit.defaultDepartment();
                clearCubit.defaultSubjectTerm();
                clearCubit.defaultUserSubject();
                Navigator.pop(context);
              },
              title: AppLocalizations.of(context)!.addNewCoordinator,
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
                    onTap: (index) => appCubit.subjectCoordinatorOnTap(index: index, context: context),
                  ), //Subject Term
                  10.height,
                  UserSubjectBottomSheet(
                    onTap: (index) => appCubit.userSubjectOnTap(index: index, context: context),
                  ),    //users
                  const Spacer(),
                  ConditionalBuilder(
                    condition: adminState is! CreateSubjectCoordinatorLoadingState,
                    builder: (context) =>
                        AddingButton(
                            text: AppLocalizations.of(context)!.add,
                            onTap: (){
                              appCubit.addCoordinatorButtonOnTap(formKey: formKey, context: context);
                            }
                        ),
                    fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          );
  },
),
        ),
        );
      },
    );
  }
}
