import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class AddingButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function() onTap;
  const AddingButton({super.key, required this.text, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width ,
        height: 50.h,
        decoration: BoxDecoration(
          color: MyColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(icon ?? FontAwesomeIcons.add,
                    color: MyColors.primaryColor,
                    size: 18,
                  ),
                )),
            10.width,
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
