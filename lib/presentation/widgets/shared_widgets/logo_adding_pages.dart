import 'package:archive_app/core/imports/app_imports/app_imports.dart';

import '../../../core/image_assets/image_assets.dart';

class LogoAddingPages extends StatelessWidget {
  const LogoAddingPages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.height/4.0,
          height: MediaQuery.of(context).size.height/4.0,
          child: Image.asset(ImageAssets.logo,
              fit: BoxFit.cover),
        ));
  }
}