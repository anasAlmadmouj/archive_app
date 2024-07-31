import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class CreateUserScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  CreateUserScreen({super.key});


  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    ClearCubit clearCubit = ClearCubit.get(context);
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state,) {
        if (state is CreateUserSuccessState) {
          appCubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.createAccountSuccess , colorState: ColorState.success);
        }

        if(state is CreateUserErrorState){
          appCubit.showSnackBar(context: context, title: state.error , colorState: ColorState.error);
        }
      },
      builder: (context, state,) {
        return WillPopScope(
            onWillPop: () async {
          return false;
        },
         child: BlocBuilder<LoginCubit,LoginStates>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: customizedAppBar(
                context: context,
                function: (){
                  clearCubit.defaultDepartment();
                  clearCubit.defaultUserType();
                  appCubit.nameController.clear();
                  appCubit.emailController.clear();
                  appCubit.passwordController.clear();
                  Navigator.pop(context);
                },
                title: AppLocalizations.of(context)!.createAccount,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0 , right: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LogoAddingPages(),
                        20.height,
                        CustomTextField(
                          controller: appCubit.nameController,
                          width: MediaQuery.sizeOf(context).width/1.2,
                          labelText: AppLocalizations.of(context)!.userName,
                        ),

                        10.height,
                        CustomTextField(
                          controller: appCubit.emailController,
                          width: MediaQuery.sizeOf(context).width/1.2,
                          labelText: AppLocalizations.of(context)!.email,
                          prefixIcon: Icons.email,
                        ),
                        10.height,
                        CustomTextField(
                          controller: appCubit.passwordController,
                          width: MediaQuery.sizeOf(context).width/1.2,
                          labelText: AppLocalizations.of(context)!.password,
                          prefixIcon: Icons.lock,
                          suffixIcon: LoginCubit.get(context).suffixIcon,
                          suffixPressed: () {
                            LoginCubit.get(context).visiblePassword();
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: LoginCubit.get(context).isPassword,
                        ),
                        10.height,
                        DepartmentBottomSheet(
                          onTap: (index) => appCubit.departmentOnTap(index: index, context: context),
                        ),
                        10.height,
                        UserTypeBottomSheet(
                          onTap: (index) => appCubit.userTypeOnTap(index: index, context: context),
                        ),
                        Spacer(),
                        ConditionalBuilder(
                          condition: state is! CreateUserLoadingState,
                          builder: (context) => AddingButton(
                              text: AppLocalizations.of(context)!.createAccount,
                              onTap: () {
                                appCubit.createUserButtonOnTap(formKey: formKey, context: context);
                              },
                          ),
                          fallback: (context) => const CircularProgressIndicator(),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        );
      },

    );
  }
}
