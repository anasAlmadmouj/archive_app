import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LoginCubit.get(context).usersModel.userName.toString(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal),
          ),
          Text(LoginCubit.get(context).usersModel.userEmail.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey , fontSize: 16),
          ),
        ],
      ),

    );
  }
}
