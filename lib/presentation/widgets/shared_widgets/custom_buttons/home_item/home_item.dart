import '../../../../../core/imports/app_imports/app_imports.dart';

class HomeItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final void Function()? onTap;
  const HomeItem({super.key, required this.title, required this.description, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).width/3.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1 , color: Theme.of(context).colorScheme.primary),
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(title , style: Theme.of(context).textTheme.bodyMedium,),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(description , style: Theme.of(context).textTheme.titleSmall,),
          ),
          leading: Icon(icon, size: 36, color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
