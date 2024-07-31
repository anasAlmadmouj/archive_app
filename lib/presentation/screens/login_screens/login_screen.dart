import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is LoginErrorState){
          AppCubit.get(context).showSnackBar(context: context, title: state.error , colorState: ColorState.error);
        }
      },
      builder: (BuildContext context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: formKey,
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 25, left: 25, bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoAddingPages(),
                   Center(
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 30.sp)
                    ),
                  ),
                  15.height,
                  CustomTextField(
                    controller: loginCubit.emailController,
                    width: MediaQuery.sizeOf(context).width/1.2,
                    labelText: AppLocalizations.of(context)!.email,
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  20.height,
                  CustomTextField(
                      controller: loginCubit.passwordController,
                      width: MediaQuery.sizeOf(context).width/1.2,
                      labelText: AppLocalizations.of(context)!.password,
                      prefixIcon: Icons.lock,
                      suffixIcon: LoginCubit.get(context).suffixIcon,
                      obscureText: LoginCubit.get(context).isPassword,
                      suffixPressed: () {
                      LoginCubit.get(context).visiblePassword();
                      },
                      keyboardType: TextInputType.visiblePassword,
                  ),

                  20.height,
                  ConditionalBuilder(
                    condition: state is! LoginLoadingState,
                    builder: (context) =>
                        AddingButton(
                          icon: Icons.login,
                            text: AppLocalizations.of(context)!.login,
                            onTap:() {
                              loginCubit.loginButtonOnTap(formKey: formKey, context: context);
                            }
                        ),
                    fallback: (context) => const CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}