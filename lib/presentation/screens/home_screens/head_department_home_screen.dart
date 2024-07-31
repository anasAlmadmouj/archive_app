
import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class HeadDepartmentHomeScreen extends StatelessWidget {
  const HeadDepartmentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeItem(
            title: AppLocalizations.of(context)!.uploadFile,
            description: AppLocalizations.of(context)!.uploadFileDescription,
            icon: Icons.upload,
            onTap: () {
              navigateTo(context, UploadScreenMobile());
            },
          ),
          12.height,
          HomeItem(
              title: AppLocalizations.of(context)!.viewData,
              description: AppLocalizations.of(context)!.viewDataDescription,
              icon: Icons.search,
              onTap: () {
                navigateTo(context, const SelectScreen());
              }
          ),
          12.height,
          HomeItem(
              title: AppLocalizations.of(context)!.viewDataWithRange,
              description:AppLocalizations.of(context)!.viewDataRangeDescription,
              icon: Icons.search,
              onTap: () {
                navigateTo(context, const SelectScreen());
              }
          ),
        ],
      ),
    );
  }
}
