import 'package:archive_app/core/imports/app_imports/app_imports.dart';
import 'package:archive_app/presentation/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FireStoreStorage.init();  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..getIsDarkValue()
            ..getLanguageValue()
            ..getAcademicYears()
            ..getDepartment()
            ..getCategory()
            ..getUserType(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => UploadCubit(),
        ),
        BlocProvider(
          create: (context) => AdminCubit()..getUsers(),
        ),
        BlocProvider(create: (context) => ClearCubit(context),)
      ],
      child: const MyAppWithTheme(),
    );
  }
}

class MyAppWithTheme extends StatelessWidget {
  const MyAppWithTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              AppCubit appCubit = AppCubit.get(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                locale: appCubit.languageValue == 'Arabic' ? const Locale('Ar') : const Locale('en'),
                theme: appCubit.isDark && appCubit.languageValue == 'Arabic' ? themeDataDarkArabic()
                : appCubit.isDark && appCubit.languageValue == 'English' ? themeDataDarkEnglish()
                : !appCubit.isDark && appCubit.languageValue == 'Arabic' ? themeDataLightArabic()
                :themeDataLightEnglish(),
                home: const SplashScreen(startWidget: Root()),
              );
            },
          ),
        );
      },
    );
  }
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        bool isSignedIn = LoginCubit.get(context).getUserSignInState();
        if (isSignedIn) {
          return const HomePage();
        }
        return LoginScreen();
      },
    );
  }
}
