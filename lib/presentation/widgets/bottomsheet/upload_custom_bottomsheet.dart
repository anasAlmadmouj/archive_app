import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class UploadCustomBottomSheet extends StatelessWidget {
  final String hintText;
  final List<String?> adminTitle;
  final List<String?> title;
  final void Function(int index)? adminOnTap;
  final void Function(int index)? onTap;
  final int adminItemCount;
  final int itemCount;
  final double? height = 400;
  final bool adminIsValid;
  final bool isValid;
  final bool adminIsHasData;
  final bool isHasData;
  final bool? isAdmin;
  const UploadCustomBottomSheet({
    super.key, this.isValid = true,
    this.onTap,
    required this.hintText,
    required this.title,
    required this.itemCount,
    this.isHasData = true,
    required this.adminTitle,
    this.adminOnTap,
    required this.adminItemCount,
    this.adminIsValid = true,
    this.adminIsHasData = true,
    this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return TextFieldDialog(
          hintText: hintText,
          onTap: () {
            if(isAdmin ?? CacheHelper.getData(key: spUserType) == userTypeAdmin){
              if(adminIsValid){
                if(adminIsHasData) {
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: const Divider(color: MyColors.grayColor,),
                                    ),
                                  ],
                                ),
                            itemCount: adminItemCount,
                            itemBuilder: (context, index) =>
                                InkWell(
                                  child: Center(
                                    child: Text(adminTitle[index] ?? ''),
                                  ),
                                  onTap: () {
                                    adminOnTap?.call(index);
                                  },
                                ),
                          ),
                        ),
                  );
                }
                else{
                  cubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.notHaveSubject, colorState: ColorState.error);

                }
              }
              else{
                cubit.showSnackBar(context: context, title: AppLocalizations.of(context)!.pleaseSelectPre, colorState: ColorState.error);
              }
            }
            else{
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
                                    10.height,
                                    const Divider(),
                                  ],
                                ),
                            itemCount: itemCount,
                            itemBuilder: (context, index) =>
                                InkWell(
                                  child: Center(child: Text(title[index] ?? '')),
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
            }

          },
        );
      },
    );
  }
}