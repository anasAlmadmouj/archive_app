import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddSubCategoryScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  AddSubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is AddSubCategorySuccessState) {
          appCubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.addNewSubCategorySuccess , colorState: ColorState.success);
        }
        if(state is AddSubCategoryErrorState){
          appCubit.showSnackBar(context: context, title: state.error , colorState: ColorState.error);
        }
      },
      builder: (context, state) {
        return BlocBuilder<AppCubit , AppStates>(
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
                    function: (){
                      ClearCubit.get(context).defaultCategory();
                      appCubit.subCategoryArController.clear();
                      appCubit.subCategoryEnController.clear();
                      Navigator.pop(context);
                    },
                    title: AppLocalizations.of(context)!.addNewSubCategory,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const LogoAddingPages(),
                        10.height,
                        CustomTextField(
                            controller: appCubit.subCategoryEnController,
                            width: MediaQuery.sizeOf(context).width/1.2,
                            labelText: AppLocalizations.of(context)!.englishName,
                        ),
                        10.height,
                        CustomTextField(
                            controller: appCubit.subCategoryArController,
                            width: MediaQuery.sizeOf(context).width/1.2,
                            labelText: AppLocalizations.of(context)!.arabicName,
                        ),
                        10.height,
                        CategoryBottomSheet(
                          onTap: (index) => appCubit.categoryOnTap(index: index, context: context),
                        ),
                        Spacer(),
                        ConditionalBuilder(
                          condition: state is! AddSubCategoryLoadingState,
                          builder: (context) =>  AddingButton(
                              text: AppLocalizations.of(context)!.add,
                              onTap: (){
                                appCubit.addSubCategoryButtonOnTap(formKey: formKey, context: context);
                              }),
                          fallback: (context) => const CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              );
            },);
      },
    );
  }

}
