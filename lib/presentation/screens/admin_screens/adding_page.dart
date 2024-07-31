import 'package:archive_app/core/imports/app_imports/app_imports.dart';


class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = getItems(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return BlocBuilder<AdminCubit, AdminStates>(
          builder: (context, state) {
            return Scaffold(
              appBar: customizedAppBar(
                context: context,
                function: () {
                  maybePop(context);
                },
                title: AppLocalizations.of(context)!.addingPage,
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => 10.height,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navigateTo(context, items[index].screen);
                      },
                      child: GridItem(item: items[index]),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}


