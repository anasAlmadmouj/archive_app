import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class LanguageContainer extends StatelessWidget {
  const LanguageContainer({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              14.width,
              Icon(Icons.language , color: Theme.of(context).colorScheme.secondaryContainer,),
              15.width,
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          RadioListTile(
            hoverColor: Theme.of(context).colorScheme.onPrimary,
            tileColor: Theme.of(context).colorScheme.onPrimary,
            title: Text(AppLocalizations.of(context)!.english, style: Theme.of(context).textTheme.bodyMedium,),
            value: 'English',
            groupValue: appCubit.languageValue,
            onChanged: (value) {
              appCubit.changeLanguageValue(value);
            },
          ),
          RadioListTile(
            hoverColor: Theme.of(context).colorScheme.onPrimary,
            title: Text(AppLocalizations.of(context)!.arabic , style: Theme.of(context).textTheme.bodyMedium,),
            value: 'Arabic',
            groupValue: appCubit.languageValue,
            onChanged: (value) {
              appCubit.changeLanguageValue(value);
            },
          ),
        ],
      ),
    );
  }
}
