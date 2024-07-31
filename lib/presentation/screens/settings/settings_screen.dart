import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customizedAppBar(
        context: context,
        function: () {
          maybePop(context);
        },
        title: AppLocalizations.of(context)!.settings,
      ),
      body: Column(
        children: [
          20.height,
          const UserInfoContainer(),
          16.height,
          const ModeContainer(),
          16.height,
          const LanguageContainer(),
          16.height,
          const LogoutContainer(),

        ],
      ),
    );
  }
}
