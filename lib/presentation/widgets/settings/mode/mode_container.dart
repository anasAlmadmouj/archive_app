import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class ModeContainer extends StatelessWidget {
  const ModeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: SwitchListTile(
        title: Text(AppLocalizations.of(context)!.darkMode , style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
        value: appCubit.isDark,
        onChanged: (value) {
          appCubit.changeThem(value);
        },
        secondary: Icon(
          appCubit.isDark ? Icons.dark_mode : Icons.light_mode,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
