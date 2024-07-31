import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class CustomBottomSheet extends StatelessWidget {
  final String hintText;
  final List<String?> title;
  final void Function(int index)? onTap;
  final int itemCount;
  final double? height = 400;
  final double? paddingTitle;
  final bool isValid;
  final bool isHasData;
  const CustomBottomSheet({
    super.key, this.isValid = true, this.onTap, required this.hintText, required this.title, required this.itemCount, this.isHasData = false, this.paddingTitle = 0,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return TextFieldDialog(
          hintText: hintText,
          onTap: () {
            if(isValid){
              if(isHasData) {
                showModalBottomSheet(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30))),
                  builder: (context) =>
                      Container(
                        height: height,
                        padding: const EdgeInsets.all(12),
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              Column(
                                children: [
                                  5.height,
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                                    child: Divider(color: MyColors.grayColor,),
                                  ),
                                ],
                              ),
                          itemCount: itemCount,
                          itemBuilder: (context, index) =>
                              InkWell(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: paddingTitle ?? 0),
                                  child: paddingTitle == 0 ? Center(child: Text(title[index] ?? ''))
                                  : Text(title[index] ?? ''),
                                ),
                                onTap: () {
                                  onTap?.call(index);
                                },
                              ),
                        ),
                      ),
                );
              }
              else{
                cubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.notHaveData, colorState: ColorState.error);

              }
            }
            else{
              cubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectPre, colorState: ColorState.error);
            }
          },
        );
      },
    );
  }
}