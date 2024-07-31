import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddUserTypeScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  AddUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return  BlocConsumer<AdminCubit,AdminStates>(
      listener: (context, state) {
        if (state is AddUserTypeSuccessState) {
          appCubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.addNewUserTypeSuccess , colorState: ColorState.success);
        }
        if(state is AddUserTypeErrorState){
          appCubit.showSnackBar(context: context, title: state.error , colorState: ColorState.error);
        }
      },
      builder:(context, state) {
        return WillPopScope(
            onWillPop: () async {
          return false;
        },
         child:  Form(
          key: formKey,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: customizedAppBar(
              context: context,
              function: (){
                appCubit.userTypeController.clear();
                Navigator.pop(context);
              },
              title: AppLocalizations.of(context)!.addNewUserType,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  40.height,
                  const LogoAddingPages(),
                  10.height,
                  CustomTextField(
                      controller: appCubit.userTypeController,
                      width: MediaQuery.sizeOf(context).width/1.2,
                      labelText: AppLocalizations.of(context)!.userType
                  ),
                  Spacer(),
                  ConditionalBuilder(
                    condition: state is! AddUserTypeLoadingState,
                    builder: (context) =>  AddingButton(
                        text: AppLocalizations.of(context)!.add,
                        onTap: (){
                          appCubit.addUserTypeButtonOnTap(formKey: formKey, context: context);
                        }),
                    fallback: (context) => const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        ),
        );
      },
      );

  }
}
