import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddDepartmentScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  AddDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    AdminCubit adminCubit = AdminCubit.get(context);
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is AddDepartmentSuccessState) {
          appCubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.addNewDepartmentSuccess, colorState: ColorState.success);
        }
        if (state is AddDepartmentErrorState) {
          appCubit.showSnackBar(context: context, title: state.error , colorState: ColorState.error);
        }
      },
      builder: (context, state) {
        return WillPopScope(
            onWillPop: () async {
          return false;
        },
         child: Form(
          key: formKey,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: customizedAppBar(
              context: context,
              function: () {
                Navigator.pop(context);
                appCubit.departmentNameArController.clear();
                appCubit.departmentNameEnController.clear();
                adminCubit.defaultUsers();
              },
              title: AppLocalizations.of(context)!.addNewDepartment,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  children: [
                  const LogoAddingPages(),
              10.height,
              CustomTextField(
                controller: appCubit.departmentNameEnController,
                width: MediaQuery.sizeOf(context).width / 1.2,
                labelText: AppLocalizations.of(context)!.englishName,
              ),
              10.height,
              CustomTextField(
                controller: appCubit.departmentNameArController,
                width: MediaQuery.sizeOf(context).width / 1.2,
                labelText: AppLocalizations.of(context)!.arabicName,
              ),
              10.height,
              UsersBottomSheet(
                hintText: AppLocalizations.of(context)!.headDepartment,
                onTap: (index) => adminCubit.usersOnTap(index: index, context: context),
              ),
              const Spacer(),
              ConditionalBuilder(
                condition: state is! AddDepartmentLoadingState,
                builder: (context) =>
                    AddingButton(
                      text: AppLocalizations.of(context)!.add,
                      onTap:(){
                        appCubit.addDepartmentButtonOnTap(formKey: formKey, context: context);
                      }
                    ),
                fallback: (context) => const CircularProgressIndicator(),
              ),
            ],
          ),
        ),)
        ,
        ),
        );
      },
    );
  }
}

