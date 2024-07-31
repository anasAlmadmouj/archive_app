import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddAcademicTermsScreen extends StatelessWidget {
    AddAcademicTermsScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    ClearCubit clearCubit = ClearCubit.get(context);
    return WillPopScope(
        onWillPop: () async {
      return false;
    },
     child: BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is AddAcademicTermsSuccessState) {
          appCubit.showSnackBar(
              context: context,
              title: AppLocalizations.of(context)!.addNewTermSuccess,
              colorState: ColorState.success);
        }
        if (state is AddAcademicTermsErrorState) {
          appCubit.showSnackBar(
              context: context,
              title: state.error,
              colorState: ColorState.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            appBar: customizedAppBar(
              context: context,
              function: () {
                clearCubit.defaultAcademicTerm();
                clearCubit.defaultAcademicYear();
                Navigator.pop(context);
              },
              title: AppLocalizations.of(context)!.addNewTerm,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const LogoAddingPages(),
                  10.height,
                  YearsBottomSheet(
                    onTap: (index) => appCubit.yearsAcademicTermsOnTap(index: index, context: context),
                  ),
                  10.height,
                  const AddTermsBottomSheet(),
                  const Spacer(),
                  ConditionalBuilder(
                    condition: state is! AddAcademicTermsLoadingState,
                    builder: (context) => AddingButton(
                        text: AppLocalizations.of(context)!.add,
                        onTap: (){
                          appCubit.addTermButtonOnTap(formKey: formKey, context: context);
                          },
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
    );
  }
}
