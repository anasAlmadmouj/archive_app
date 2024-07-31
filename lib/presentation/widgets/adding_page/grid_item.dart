import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class GridItem extends StatelessWidget {
  final Item item;

  const GridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.secondaryContainer,
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(item.icon, size: 30.sp, color: Theme.of(context).colorScheme.primary),
            SizedBox(width: MediaQuery.sizeOf(context).width/6),
            Text(
              item.title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    );
  }
}
