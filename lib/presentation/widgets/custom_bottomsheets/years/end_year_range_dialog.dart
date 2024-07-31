import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class EndYearRangeDialog extends StatelessWidget {
  const EndYearRangeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return TextFieldDialog(
          hintText: appCubit.endRangeDateTime == DateTime(-1)
              ? AppLocalizations.of(context)!.selectEndYear
              : appCubit.endRangeDateTime.year.toString(),
          onTap: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(AppLocalizations.of(context)!.selectYear , style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyColors.lightGrayColor),),
                  content: SizedBox(
                    width: 300,
                    height: 300,
                    child: YearPicker(
                      firstDate: DateTime(DateTime.now().year - 100, 1),
                      lastDate: DateTime(DateTime.now().year + 100, 1),
                      initialDate: DateTime.now(),
                      selectedDate:
                      DateTime.now(),
                      onChanged: (DateTime dateTime) => appCubit.changeEndYear(dateTime: dateTime, context: context),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

