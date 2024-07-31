import '../../../core/imports/app_imports/app_imports.dart';

class Item {
  final String title;
  final Widget screen;
  final IconData icon;

  Item({required this.title, required this.screen, required this.icon});
}

List<Item> getItems(BuildContext context) {
  return [
    Item(
        title: AppLocalizations.of(context)!.addNewUserType,
        screen: AddUserTypeScreen(),
        icon: Icons.person_add
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewDepartment,
        screen: AddDepartmentScreen(),
        icon: Icons.business
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewUser,
        screen: CreateUserScreen(),
        icon: Icons.person
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewYear,
        screen: AddAcademicYearsScreen(),
        icon: Icons.calendar_today
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewTerm,
        screen: AddAcademicTermsScreen(),
        icon: Icons.event_note
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewCategory,
        screen: AddCategoryScreen(),
        icon: Icons.category
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewSubCategory,
        screen: AddSubCategoryScreen(),
        icon: Icons.subdirectory_arrow_right
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewSubject,
        screen: AddSubjectScreen(),
        icon: Icons.book
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewSubjectTerm,
        screen: AddSubjectTermScreen(),
        icon: Icons.assignment
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewSection,
        screen: AddSectionScreen(),
        icon: Icons.layers
    ),
    Item(
        title: AppLocalizations.of(context)!.addNewCoordinator,
        screen: AddCoordinatorScreen(),
        icon: Icons.supervisor_account
    ),
  ];
}