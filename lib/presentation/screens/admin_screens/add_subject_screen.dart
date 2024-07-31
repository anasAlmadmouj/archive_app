import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddSubjectScreen extends StatelessWidget {
  AddSubjectScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return WillPopScope(
        onWillPop: () async {
      return false;
    },
     child: Form(
      key: formKey,
      child: BlocConsumer<AdminCubit, AdminStates>(
        listener: (context, adminState) {
          if (adminState is AddSubjectSuccessState) {
            appCubit.showSnackBar(
                context: context,
                title: AppLocalizations.of(context)!.addNewSubjectSuccess,
                colorState: ColorState.success);
          }
          if (adminState is AddSubjectErrorState) {
            appCubit.showSnackBar(
                context: context,
                title: adminState.error,
                colorState: ColorState.error);
          }
        },
        builder: (context, adminState) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
            appBar: customizedAppBar(
              context: context,
              function: () {
                ClearCubit.get(context).defaultDepartment();
                appCubit.subjectNameArController.clear();
                appCubit.subjectNameEnController.clear();
                appCubit.numberSubjectController.clear();
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
                  CustomTextField(
                      controller: appCubit.subjectNameEnController,
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      labelText: AppLocalizations.of(context)!.englishName,
                  ),
                  10.height, // name subject
                  CustomTextField(
                      controller: appCubit.subjectNameArController,
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      labelText: AppLocalizations.of(context)!.arabicName,
                  ), // number subject
                  10.height,
                  CustomTextField(
                      controller: appCubit.numberSubjectController,
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      labelText: AppLocalizations.of(context)!.numberSubject,
                  ),
                  10.height,
                  DepartmentBottomSheet(
                    onTap: (index) => appCubit.departmentOnTap(index: index, context: context),
                  ),
                  Spacer(),
                  adminState is AddSubjectLoadingState
                      ? Center(child: const CircularProgressIndicator())
                      : AddingButton(
                          text: AppLocalizations.of(context)!.add,
                          onTap: () {
                            appCubit.addSubjectButtonOnTap(formKey: formKey, context: context);
                          }),
                ],
              ),
            ),
          );
        },
      ),
    ),
    );
  }
}
