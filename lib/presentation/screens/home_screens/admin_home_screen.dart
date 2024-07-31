
import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0.w , right: 12.0.w , left: 12.0.w , top: MediaQuery.sizeOf(context).height/12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           HomeItem(
            title: AppLocalizations.of(context)!.uploadFile,
            description: AppLocalizations.of(context)!.uploadFileDescription,
            icon: Icons.upload,
            onTap: () {
              navigateTo(context, const UploadScreenMobile());
            },
          ),
          12.height,
           HomeItem(
              title: AppLocalizations.of(context)!.addingPages,
              description: AppLocalizations.of(context)!.addingPagesDescription,
              icon: Icons.add,
              onTap: () {
                navigateTo(context,  const AddingPage());
              }
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
                 navigateTo(context, const SelectRangeScreen());
               }
               ),
        ],
      ),
    );
  }
}
