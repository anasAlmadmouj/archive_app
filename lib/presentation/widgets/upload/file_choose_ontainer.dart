import 'package:archive_app/core/imports/app_imports/app_imports.dart';

class FileChooseContainer extends StatelessWidget {
  const FileChooseContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadCubit, UploadStates>(
      builder: (context, uploadState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child:
              ListTile(
                leading: Icon(FontAwesomeIcons.filePdf , color: Colors.red.shade400,),
                title: Text(
                  'Name : ${UploadCubit.get(context).fileName}',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  'Size: ${UploadCubit.get(context).fileSize} megabytes',
                  style: Theme.of(context).textTheme.bodySmall,

                ),
              ),

            ),
          ),
        );
      },
    );
  }
}
