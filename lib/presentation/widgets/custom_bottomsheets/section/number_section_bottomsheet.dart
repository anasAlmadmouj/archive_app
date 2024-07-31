import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:archive_app/data/models/lists/lists.dart';

class NumberSectionBottomSheet extends StatelessWidget {
  final void Function(int)? onTap;
  const NumberSectionBottomSheet({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {

        List<int> list = numberSectionList;
        return CustomBottomSheet(
            isHasData: list.isNotEmpty,
            itemCount: list.length,
            hintText: AdminCubit.get(context).numberSection == 0 ?
                AppLocalizations.of(context)!.selectNumberOfSection
            :AdminCubit.get(context).numberSection.toString(),
            title: list
                .map((e) => e.toString())
                .toList(),
            onTap: (index) => appCubit.numberSectionOnTap(index: index, context: context,)
        );
      },
    );
  }
}

