

import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState()) {
    getUserFromDB();
  }

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_off_outlined;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  UsersModel usersModel = UsersModel();

  void getUserFromDB() {
    if (CacheHelper.getData(key: spUser) != null) {
      Map<String, dynamic> userJsonData =
          json.decode(CacheHelper.getData(key: spUser));
      UsersModel tempUserModel = UsersModel.fromJson(userJsonData);

      if (userJsonData.isNotEmpty) {
        usersModel = tempUserModel;
        emit(GetUserInfoSuccessState());
      }
    }
  }

  void visiblePassword() {
    if (isPassword) {
      isPassword = !isPassword;
      suffixIcon = Icons.remove_red_eye_outlined;
    } else {
      isPassword = !isPassword;
      suffixIcon = Icons.visibility_off_outlined;
    }
    emit(SuffixIsPasswordState());
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (value.user?.uid != null) {
        return true;
      }
      return false;
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      return false;
    });
  }

  Future<void> firebaseLogout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> logout({required BuildContext context}) async {
    await firebaseLogout().whenComplete(() {
      CacheHelper.removeData(key: spIsSignedIn);
      CacheHelper.removeData(key: spUserType);
      navigateToAndRemoveUntil(context, const Root());
    });
  }

  String? userTypeName = '';

  List<UsersModel> userInfoList = [];
  List<UserTypeModel> userTypeList = [];
  SubjectTermModel? userSubjectModel;

  void getUserInfo({required BuildContext context}) async {
    final user = FirebaseAuth.instance.currentUser;
    String? userTypeId;
    emit(GetUserInfoLoadingState());
    if (user != null) {
      await FireStoreStorage.fireStore
          .collection(usersCollection)
          .where('userId', isEqualTo: user.uid)
          .get()
          .then((value) {
            for (var element in value.docs) {
              userTypeId = UsersModel.fromJson(element.data()).userTypeId!;
              userInfoList.add(UsersModel.fromJson(element.data()));
              UsersModel? userModel = UsersModel.fromJson(element.data());
              String userStr = json.encode(userModel.toMap());
              CacheHelper.saveData(key: spUser, value: userStr);
              getUserFromDB();
              emit(GetUserInfoSuccessState());
            }
          })
          .whenComplete(() async {
                await FireStoreStorage.fireStore
                    .collection(userTypeCollection)
                    .doc(userTypeId)
                    .get()
                    .then((value) {
                  userTypeName = value.data()!['userTypeName'];
                  CacheHelper.saveData(key: spUserType, value: userTypeName);
                  emit(GetUserTypeSuccessState());
                });
              })
          .catchError((error) {
            print(error.toString());
            emit(GetUserTypeErrorState());
          });
    }
  }

  Future<void> storeUserSignInState(bool isSignedIn) =>
      CacheHelper.saveData(key: spIsSignedIn, value: isSignedIn);

  bool getUserSignInState() => CacheHelper.getData(key: spIsSignedIn) ?? false;

  void checkUserAuth() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        await storeUserSignInState(false);
      } else {
        await storeUserSignInState(true);
      }
    });
  }

  Future<void> loginButtonOnTap({required GlobalKey<FormState> formKey , required BuildContext context})async{
    if (formKey.currentState!.validate()) {
      await login(
          email: emailController.text,
          password: passwordController.text).then((bool isSuccess) => isSuccess
          ? {
        storeUserSignInState(true),
        getUserInfo(
            context: context),
      }
          : null);
    }
  }
}
