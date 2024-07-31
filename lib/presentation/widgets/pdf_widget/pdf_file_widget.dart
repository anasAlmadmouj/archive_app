import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class PdfItemWidget extends StatelessWidget {
  final FilesModel pdfModel;
  final int index;

  const PdfItemWidget({super.key, required this.pdfModel, required this.index});
  // ignore: unused_element
  _launchURL() async {
    const url = 'https://flutter.dev/exapmle.pdf';
    // ignore: deprecated_member_use
    if (await canLaunch(pdfModel.fileUrl!)) {
      // ignore: deprecated_member_use
      await launch(pdfModel.fileUrl!);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        onTap: () => navigateTo(
            context,
            PdfView(
              link: pdfModel.fileUrl!,
              title: pdfModel.fileName!,
            )),
        leading: Image.asset(
          'assets/images/pdf.png',
          width: 40,
          height: 40,
        ),
        title: Text(
          pdfModel.fileName ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              pdfModel.yearName ?? '',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 2),
            Text(
              pdfModel.termNameEn ?? '',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 2),
            !listEquals(
              AppCubit.get(context)
                  .selectedSubCategory
                  ?.subCategoryNameAr,
              ['نموذج تنفيذ وتقييم اداء الطلبة'],
            )
                ? Text(
              pdfModel.sectionNameEn ?? '',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            )
                : Text(
              pdfModel.subjectNameEn ?? '',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Confirm Delete'),
                  content: const Text(
                      'Are you sure you want to delete this file?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: (){
                        AppCubit.get(context).deleteFile(
                          fileId: pdfModel.fileId ?? '',
                        ).then((value) {
                          AppCubit.get(context).filesList.clear();
                        }).whenComplete(() {
                          print('7tft.......${AppCubit.get(context).filesList.isEmpty}');
                          CacheHelper.getData(key: spUserType) ==
                              userTypeAdmin &&
                              AppCubit.get(context).isSelectRange ==
                                  false
                              ? AppCubit.get(context).getFiles(
                            yearId: AppCubit.get(context)
                                .selectedYears
                                ?.academicYearsId,
                            termId: AppCubit.get(context)
                                .selectedAcademicTerm
                                ?.academicTermsId,
                            departmentId: AppCubit.get(context)
                                .selectedDepartment
                                ?.departmentId,
                            categoryId: AppCubit.get(context)
                                .selectedCategory
                                ?.categoryId,
                            subCategoryId: AppCubit.get(context)
                                .selectedSubCategory
                                ?.subCategoryId,
                            subjectId: AppCubit.get(context)
                                .selectedSubjectTerm
                                ?.subjectId,
                          )
                              : CacheHelper.getData(key: spUserType) ==
                              userTypeAdmin &&
                              AppCubit.get(context)
                                  .isSelectRange ==
                                  true
                              ? AppCubit.get(context).getFilesRange(
                            startYear: AppCubit.get(context)
                                .startRangeDateTime
                                .year,
                            endYear: AppCubit.get(context)
                                .endRangeDateTime
                                .year,
                            departmentId: AppCubit.get(context)
                                .selectedDepartment!
                                .departmentId,
                            categoryId: AppCubit.get(context)
                                .selectedCategory!
                                .categoryId,
                            subCategoryId: AppCubit.get(context)
                                .selectedSubCategory!
                                .subCategoryId,
                            subjectId: AppCubit.get(context)
                                .selectedSubjects!
                                .subjectId,
                          )
                              : CacheHelper.getData(key: spUserType) == userTypeUser &&
                              AppCubit.get(context).isSelectRange == false ?
                          AppCubit.get(context).getUserFiles(
                            yearId: AppCubit.get(context).selectedYears?.academicYearsId,
                            termId: AppCubit.get(context).selectedAcademicTerm?.academicTermsId,
                            departmentId: AppCubit.get(context).selectedDepartment?.departmentId,
                            categoryId: AppCubit.get(context).selectedCategory?.categoryId,
                            subjectId: AppCubit.get(context).selectedUploadSubject?.subjectId,
                            sectionId: AppCubit.get(context).selectedSection?.sectionId,
                          )
                              : null;
                          print('gbt.......${AppCubit.get(context).filesList.isEmpty}');
                          Navigator.pop(context);
                        });
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.delete),
        ),
      ),
    );
  }
}




