import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String labelText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final void Function()? suffixPressed;
  const CustomTextField({
    super.key,
    required this.controller, required this.width, required this.labelText, this.suffixIcon , this.prefixIcon, this.suffixPressed, this.obscureText, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: width,
        child: TextFormField(
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            errorStyle: Theme.of(context).textTheme.bodySmall,
            labelStyle: Theme.of(context).textTheme.bodySmall,
            labelText: labelText,
            suffixIcon: IconButton(icon: Icon(suffixIcon , color: Theme.of(context).colorScheme.primary) , onPressed: suffixPressed,),
            prefixIcon: Icon(prefixIcon , color: Theme.of(context).colorScheme.primary,),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16) , bottomRight: Radius.circular(16)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16) , bottomRight: Radius.circular(16)),
            ),
          ),
          controller: controller,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
          validator: (value) => AppCubit.get(context).validateFormField(value, AppLocalizations.of(context)!.required),

        ),
      ),
    );
  }
}
