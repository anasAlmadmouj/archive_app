import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddCategoryScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  AddCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocConsumer<AdminCubit , AdminStates>(
      listener: (context, state) {
        if(state is AddCategorySuccessState){
          appCubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.addNewCategorySuccess , colorState: ColorState.success);
        }
        if(state is AddCategoryErrorState){
          appCubit.showSnackBar(context: context, title: state.error , colorState: ColorState.error);
        }
      },
        builder: (context, state) {
          AdminCubit adminCubit = AdminCubit.get(context);
          return  WillPopScope(
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
                  ClearCubit.get(context).defaultDepartment();
                  appCubit.categoryNameArController.clear();
                  appCubit.categoryNameEnController.clear();
                  Navigator.pop(context);
                },
                title: AppLocalizations.of(context)!.addNewCategory,
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const LogoAddingPages(),
                    10.height,
                    CustomTextField(
                        controller: appCubit.categoryNameEnController,
                        width: MediaQuery.sizeOf(context).width/1.2,
                        labelText: AppLocalizations.of(context)!.englishName,
                    ),
                    10.height,
                    CustomTextField(
                      controller: appCubit.categoryNameArController,
                      width: MediaQuery.sizeOf(context).width/1.2,
                      labelText: AppLocalizations.of(context)!.arabicName,
                    ),
                    10.height,
                    DepartmentBottomSheet(
                      onTap: (index) => appCubit.departmentOnTap(index: index, context: context),
                    ),
                    Spacer(),
                    ConditionalBuilder(
                      condition: state is! AddCategoryLoadingState,
                      builder: (context) =>  AddingButton(
                          text: AppLocalizations.of(context)!.add,
                          onTap: () {
                            appCubit.addCategoryButtonOnTap(formKey: formKey, context: context);
                          }
                      ),
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
