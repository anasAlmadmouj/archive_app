import 'package:archive_app/core/imports/app_imports/app_imports.dart';


class AddAcademicYearsScreen extends StatelessWidget {
  AddAcademicYearsScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is AddAcademicYearsSuccessState) {
          AppCubit.get(context).showSnackBar(context: context, title: AppLocalizations.of(context)!.addNewYearSuccess ,  colorState: ColorState.success);
        }
        if (state is AddAcademicYearsErrorState) {
          AppCubit.get(context).showSnackBar(context: context, title: state.error ,  colorState: ColorState.error);
        }
      },
      builder: (context, state) {
        return WillPopScope(
            onWillPop: () async {
          return false;
        },
         child:  Form(
          key: formKey,
          child: Scaffold(
            appBar: customizedAppBar(
              context: context,
              function: () {
                AdminCubit.get(context).startDateTime = DateTime(-1);
                AdminCubit.get(context).endDateTime = DateTime(-1);
                Navigator.pop(context);
              },
              title: AppLocalizations.of(context)!.addNewYear,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const LogoAddingPages(),
                  10.height,
                  const StartYearDialog(),    //select start year
                  10.height,
                  const EndYearDialog(),     //select end year
                  const Spacer(),
                  ConditionalBuilder(
                    condition: state is! AddAcademicYearsLoadingState,
                    builder: (context) => AddingButton(text: AppLocalizations.of(context)!.add,
                        onTap: () async {
                          appCubit.addYearButtonOnTap(formKey: formKey, context: context);
                        }
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
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
