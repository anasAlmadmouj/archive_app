import '../imports/app_imports/app_imports.dart';

class FireStoreStorage {
  static late FirebaseFirestore fireStore;

  static void init() {
    fireStore = FirebaseFirestore.instance;
  }
}