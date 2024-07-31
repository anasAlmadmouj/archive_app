import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class LogoutContainer extends StatelessWidget {
  const LogoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: ListTile(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title:  Text(AppLocalizations.of(context)!.confirmation),
                content:  Text(AppLocalizations.of(context)!.confirmationLogoutAsk),
                actions: [
                  TextButton(
                    child: Text(AppLocalizations.of(context)!.cancel),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                  TextButton(
                    child: Text(AppLocalizations.of(context)!.logout),
                    onPressed: () {
                      Navigator.of(context).pop();
                      LoginCubit.get(context).logout(context: context); // Perform logout operation
                    },
                  ),
                ],
              );
            },
          );
        },
        leading: Icon(Icons.logout , color: Colors.red.shade600,),
        title: Text(AppLocalizations.of(context)!.logout , style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
        subtitle: Text(AppLocalizations.of(context)!.logout , style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey , height: 2),),
      ),
    );
  }
}
