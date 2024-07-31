import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class UploadCubit extends Cubit<UploadStates> {
  UploadCubit() : super(UploadInitialState());

  static UploadCubit get(context) => BlocProvider.of(context);

  FilePickerResult? resultPdf;
  String? pdfUrlFile = '';
  Uint8List? memoryPdfFile;
  String? fileName = '';
  double? fileSize = 0;


  selectPdfFile() async {
    resultPdf = (await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    ))!;
    fileName = resultPdf!.files.single.name;
    fileSize = (resultPdf!.files.single.size / 10000).roundToDouble() / 100;
    emit(PickedFileSuccessState());
  }

  Future uploadFile({
    required String? fileId,
    required String? fileYear,
    required String? fileTerm,
    required String? departmentId,
    required String? subjectId,
    required String? sectionId,
    required String? categoryId,
    required String? subCategoryId,
    required String? sectionNameAr,
    required String? sectionNameEn,
    required String? categoryNameAr,
    required String? categoryNameEn,
    required String? subCategoryNameAr,
    required String? subCategoryNameEn,
    required String? yearName,
    required String? termNameAr,
    required String? termNameEn,
    required String? subjectNameAr,
    required String? subjectNameEn,
  }) async {
    final file = File(resultPdf!.files.single.path!);
    final user = FirebaseAuth.instance.currentUser;

    emit(UploadLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('$categoryNameEn')
        .child('$subCategoryNameEn')
        .child(resultPdf!.files.single.name)
        .putFile(file)
        .then((value) {
      value.ref.getDownloadURL().then((url) {
        if (user != null) {
          FilesModel filesModel = FilesModel(
            subCategoryNameAr: subCategoryNameAr,
            subCategoryNameEn: subCategoryNameEn,
            termId: fileTerm,
            yearId: fileYear,
            subCategoryId: subCategoryId,
            categoryId: categoryId,
            sectionId: sectionId,
            subjectId: subjectId,
            departmentId: departmentId,
            fileName: fileName,
            fileId: fileId,
            fileUrl: url,
            sectionNameAr: sectionNameAr,
            sectionNameEn: sectionNameEn,
            yearName: yearName,
            subjectNameEn: subCategoryNameEn,
            subjectNameAr: subjectNameAr,
            termNameEn: termNameEn,
            termNameAr: termNameAr,
            userId: user.uid,
          );
          createFile(filesModel: filesModel);
          emit(UploadSuccessState());
        }
      }).catchError((onError) {
        emit(UploadCheckSuccessState());
      }).catchError((error) {
        emit(UploadErrorState(error.toString()));
      });
    });
  }

  Future<void> createFile({required FilesModel filesModel}) async {
    await FireStoreStorage.fireStore
        .collection(fileCollection)
        .doc(filesModel.fileId ?? '')
        .set(filesModel.toMap());
  }

} // Function to upload a file and create its corresponding document in Firestore

// Once the file is uploaded, a FilesModel object is created and stored in Firestore
