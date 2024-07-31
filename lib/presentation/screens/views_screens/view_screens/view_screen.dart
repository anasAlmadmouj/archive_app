import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  void launchU(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: customizedAppBar(
            context: context,
            function: () {
              setState(() {
                appCubit.yearsIdList.clear();
                appCubit.uniqueYearsIdList.clear();
                appCubit.filesList.clear();
              });
              maybePop(context);
            },
            title: AppLocalizations.of(context)!.digitalArchive,
          ),
          body: state is GetFilesLoadingState ? Center(child: CircularProgressIndicator())
            : appCubit.filesList.isNotEmpty ? ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: appCubit.filesList.length,
            itemBuilder: (context, index) {
              final file = appCubit.filesList[index];
              return ListTile(
                onTap: () {
                  UrlHelper.launchInBrowser(Uri.parse(file.fileUrl ?? ''));
                },
                leading: Icon(FontAwesomeIcons.filePdf , color: Colors.red.shade400,),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      file.yearName ?? '',
                      style: Theme.of(context).textTheme.titleSmall
                    ),
                    const SizedBox(height: 2),
                    Text(
                      file.termNameEn ?? '',
                      style: Theme.of(context).textTheme.titleSmall
                    ),
                    const SizedBox(height: 2),
                    !listEquals(
                      appCubit
                          .selectedSubCategory
                          ?.subCategoryNameAr,
                      ['نموذج تنفيذ وتقييم اداء الطلبة'],
                    )
                        ? Text(
                            file.sectionNameEn ?? '',
                            style: Theme.of(context).textTheme.titleSmall
                          )
                        : Text(
                            file.subjectNameEn ?? '',
                            style: Theme.of(context).textTheme.titleSmall
                          ),
                  ],
                ),
                trailing: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(AppLocalizations.of(context)!.confirmDelete , style: Theme.of(context).textTheme.bodySmall,),
                          content: Text(
                            AppLocalizations.of(context)!.confirmDeleteMessage, style: Theme.of(context).textTheme.titleSmall , ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(AppLocalizations.of(context)!.cancel),
                            ),
                            TextButton(
                              onPressed: (){
                                 appCubit.deleteFileOnTap(context: context, index: index);
                              },
                              child: Text(AppLocalizations.of(context)!.delete),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child:  Icon(Icons.delete , color: Theme.of(context).colorScheme.onPrimary,),
                ),
              );
            },
          )
              : Center(child: Text(AppLocalizations.of(context)!.notHaveData , style: Theme.of(context).textTheme.bodyMedium,)),
        );
      },
    );
  }
}

