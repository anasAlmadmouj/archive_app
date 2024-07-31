import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit , LoginStates>(
      builder: (context, state) {
        var currentBackPressTime;
        return WillPopScope(
            onWillPop: () async {
          DateTime now = DateTime.now();

          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime) > const Duration(seconds: 2)){
            currentBackPressTime = now;
            AppCubit.get(context).showSnackBar(context: context, title: AppLocalizations.of(context)!.clickAgain,
                colorState: ColorState.error,
            );
            return Future.value(false);
          }
          return Future.value(true);
        },
         child:  Scaffold(
          appBar: customizedAppBar(
            context: context,
            function: () {
              navigateTo(context, const SettingsScreen());
            },
            icon: FontAwesomeIcons.gear,
            colorIcon: Colors.grey,
            title: AppLocalizations.of(context)!.digitalArchive,
          ),
          body: CacheHelper.getData(key: spUserType) == userTypeAdmin ? const AdminHomeScreen()
                : CacheHelper.getData(key: spUserType) == userTypeHeadDepartment ? const HeadDepartmentHomeScreen()
                : CacheHelper.getData(key: spUserType) == userTypeUser ? const UserHomeScreen()
                : const SizedBox(),
        ),
        );
      },
    );
  }
}