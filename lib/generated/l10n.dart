// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get department {
    return Intl.message(
      'Department',
      name: 'department',
      desc: '',
      args: [],
    );
  }

  /// `Academic Year`
  String get academicYear {
    return Intl.message(
      'Academic Year',
      name: 'academicYear',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Section`
  String get section {
    return Intl.message(
      'Section',
      name: 'section',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Coordinator`
  String get coordinator {
    return Intl.message(
      'Coordinator',
      name: 'coordinator',
      desc: '',
      args: [],
    );
  }

  /// `User Subject`
  String get userSubject {
    return Intl.message(
      'User Subject',
      name: 'userSubject',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users {
    return Intl.message(
      'Users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Add New Term`
  String get addNewTerm {
    return Intl.message(
      'Add New Term',
      name: 'addNewTerm',
      desc: '',
      args: [],
    );
  }

  /// `Academic Term`
  String get academicTerm {
    return Intl.message(
      'Academic Term',
      name: 'academicTerm',
      desc: '',
      args: [],
    );
  }

  /// `Subcategory`
  String get subCategory {
    return Intl.message(
      'Subcategory',
      name: 'subCategory',
      desc: '',
      args: [],
    );
  }

  /// `Click Again To Exit`
  String get clickAgain {
    return Intl.message(
      'Click Again To Exit',
      name: 'clickAgain',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Year`
  String get pleaseSelectYear {
    return Intl.message(
      'Please Select Year',
      name: 'pleaseSelectYear',
      desc: '',
      args: [],
    );
  }

  /// `The term is already exist in year`
  String get theTermIsExit {
    return Intl.message(
      'The term is already exist in year',
      name: 'theTermIsExit',
      desc: '',
      args: [],
    );
  }

  /// `New year added successfully`
  String get addNewYearSuccess {
    return Intl.message(
      'New year added successfully',
      name: 'addNewYearSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Add New Year`
  String get addNewYear {
    return Intl.message(
      'Add New Year',
      name: 'addNewYear',
      desc: '',
      args: [],
    );
  }

  /// `New category added successfully`
  String get addNewCategorySuccess {
    return Intl.message(
      'New category added successfully',
      name: 'addNewCategorySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Add New Category`
  String get addNewCategory {
    return Intl.message(
      'Add New Category',
      name: 'addNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `English Name`
  String get englishName {
    return Intl.message(
      'English Name',
      name: 'englishName',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Name`
  String get arabicName {
    return Intl.message(
      'Arabic Name',
      name: 'arabicName',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Department`
  String get pleaseSelectDepartment {
    return Intl.message(
      'Please Select Department',
      name: 'pleaseSelectDepartment',
      desc: '',
      args: [],
    );
  }

  /// `Category already exists`
  String get categoryExist {
    return Intl.message(
      'Category already exists',
      name: 'categoryExist',
      desc: '',
      args: [],
    );
  }

  /// `Coordinator added successfully`
  String get addNewCoordinatorSuccess {
    return Intl.message(
      'Coordinator added successfully',
      name: 'addNewCoordinatorSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Coordinator`
  String get pleaseSelectCoordinator {
    return Intl.message(
      'Please Select Coordinator',
      name: 'pleaseSelectCoordinator',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Section`
  String get pleaseSelectSection {
    return Intl.message(
      'Please Select Section',
      name: 'pleaseSelectSection',
      desc: '',
      args: [],
    );
  }

  /// `Please Select User`
  String get pleaseSelectUser {
    return Intl.message(
      'Please Select User',
      name: 'pleaseSelectUser',
      desc: '',
      args: [],
    );
  }

  /// `Please Select User Type`
  String get pleaseSelectUserType {
    return Intl.message(
      'Please Select User Type',
      name: 'pleaseSelectUserType',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Term`
  String get pleaseSelectTerm {
    return Intl.message(
      'Please Select Term',
      name: 'pleaseSelectTerm',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Category`
  String get pleaseSelectCategory {
    return Intl.message(
      'Please Select Category',
      name: 'pleaseSelectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Subcategory`
  String get pleaseSelectSubCategory {
    return Intl.message(
      'Please Select Subcategory',
      name: 'pleaseSelectSubCategory',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Subject`
  String get pleaseSelectSubject {
    return Intl.message(
      'Please Select Subject',
      name: 'pleaseSelectSubject',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Start Year`
  String get pleaseSelectStartYear {
    return Intl.message(
      'Please Select Start Year',
      name: 'pleaseSelectStartYear',
      desc: '',
      args: [],
    );
  }

  /// `Please Select End Year`
  String get pleaseSelectEndYear {
    return Intl.message(
      'Please Select End Year',
      name: 'pleaseSelectEndYear',
      desc: '',
      args: [],
    );
  }

  /// `New department added successfully`
  String get addNewDepartmentSuccess {
    return Intl.message(
      'New department added successfully',
      name: 'addNewDepartmentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `New section added successfully`
  String get addNewSectionSuccess {
    return Intl.message(
      'New section added successfully',
      name: 'addNewSectionSuccess',
      desc: '',
      args: [],
    );
  }

  /// `New subcategory added successfully`
  String get addNewSubCategorySuccess {
    return Intl.message(
      'New subcategory added successfully',
      name: 'addNewSubCategorySuccess',
      desc: '',
      args: [],
    );
  }

  /// `New subject added successfully`
  String get addNewSubjectSuccess {
    return Intl.message(
      'New subject added successfully',
      name: 'addNewSubjectSuccess',
      desc: '',
      args: [],
    );
  }

  /// `New user type added successfully`
  String get addNewUserTypeSuccess {
    return Intl.message(
      'New user type added successfully',
      name: 'addNewUserTypeSuccess',
      desc: '',
      args: [],
    );
  }

  /// `New academic term added successfully`
  String get addNewTermSuccess {
    return Intl.message(
      'New academic term added successfully',
      name: 'addNewTermSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Add New Department`
  String get addNewDepartment {
    return Intl.message(
      'Add New Department',
      name: 'addNewDepartment',
      desc: '',
      args: [],
    );
  }

  /// `Add New Section`
  String get addNewSection {
    return Intl.message(
      'Add New Section',
      name: 'addNewSection',
      desc: '',
      args: [],
    );
  }

  /// `Add New Subcategory`
  String get addNewSubCategory {
    return Intl.message(
      'Add New Subcategory',
      name: 'addNewSubCategory',
      desc: '',
      args: [],
    );
  }

  /// `Add New Subject`
  String get addNewSubject {
    return Intl.message(
      'Add New Subject',
      name: 'addNewSubject',
      desc: '',
      args: [],
    );
  }

  /// `User Type`
  String get userType {
    return Intl.message(
      'User Type',
      name: 'userType',
      desc: '',
      args: [],
    );
  }

  /// `Subject Number`
  String get numberSubject {
    return Intl.message(
      'Subject Number',
      name: 'numberSubject',
      desc: '',
      args: [],
    );
  }

  /// `Add New User Type`
  String get addNewUserType {
    return Intl.message(
      'Add New User Type',
      name: 'addNewUserType',
      desc: '',
      args: [],
    );
  }

  /// `Department already exists`
  String get departmentExist {
    return Intl.message(
      'Department already exists',
      name: 'departmentExist',
      desc: '',
      args: [],
    );
  }

  /// `Subject number already exists`
  String get numberSubjectExist {
    return Intl.message(
      'Subject number already exists',
      name: 'numberSubjectExist',
      desc: '',
      args: [],
    );
  }

  /// `Subject already exists in this term`
  String get subjectExistTerm {
    return Intl.message(
      'Subject already exists in this term',
      name: 'subjectExistTerm',
      desc: '',
      args: [],
    );
  }

  /// `Year already exists`
  String get yearExist {
    return Intl.message(
      'Year already exists',
      name: 'yearExist',
      desc: '',
      args: [],
    );
  }

  /// `Subcategory already exists in this category`
  String get subCategoryExist {
    return Intl.message(
      'Subcategory already exists in this category',
      name: 'subCategoryExist',
      desc: '',
      args: [],
    );
  }

  /// `Adding Page`
  String get addingPage {
    return Intl.message(
      'Adding Page',
      name: 'addingPage',
      desc: '',
      args: [],
    );
  }

  /// `Add New User`
  String get addNewUser {
    return Intl.message(
      'Add New User',
      name: 'addNewUser',
      desc: '',
      args: [],
    );
  }

  /// `Add New Coordinator`
  String get addNewCoordinator {
    return Intl.message(
      'Add New Coordinator',
      name: 'addNewCoordinator',
      desc: '',
      args: [],
    );
  }

  /// `Add New Term Subject`
  String get addNewSubjectTerm {
    return Intl.message(
      'Add New Term Subject',
      name: 'addNewSubjectTerm',
      desc: '',
      args: [],
    );
  }

  /// `No sections available for this subject yet`
  String get notHaveSection {
    return Intl.message(
      'No sections available for this subject yet',
      name: 'notHaveSection',
      desc: '',
      args: [],
    );
  }

  /// `No subjects available for this department yet`
  String get notHaveSubject {
    return Intl.message(
      'No subjects available for this department yet',
      name: 'notHaveSubject',
      desc: '',
      args: [],
    );
  }

  /// `No subjects available for this term yet`
  String get notHaveSubjectTerm {
    return Intl.message(
      'No subjects available for this term yet',
      name: 'notHaveSubjectTerm',
      desc: '',
      args: [],
    );
  }

  /// `Select End Year`
  String get selectEndYear {
    return Intl.message(
      'Select End Year',
      name: 'selectEndYear',
      desc: '',
      args: [],
    );
  }

  /// `Select Start Year`
  String get selectStartYear {
    return Intl.message(
      'Select Start Year',
      name: 'selectStartYear',
      desc: '',
      args: [],
    );
  }

  /// `Select Year`
  String get selectYear {
    return Intl.message(
      'Select Year',
      name: 'selectYear',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get createAccountSuccess {
    return Intl.message(
      'Account created successfully',
      name: 'createAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `File uploaded successfully`
  String get uploadSuccess {
    return Intl.message(
      'File uploaded successfully',
      name: 'uploadSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Upload File`
  String get uploadFile {
    return Intl.message(
      'Upload File',
      name: 'uploadFile',
      desc: '',
      args: [],
    );
  }

  /// `Choose File`
  String get chooseFile {
    return Intl.message(
      'Choose File',
      name: 'chooseFile',
      desc: '',
      args: [],
    );
  }

  /// `Head of Department`
  String get headDepartment {
    return Intl.message(
      'Head of Department',
      name: 'headDepartment',
      desc: '',
      args: [],
    );
  }

  /// `Upload File To Archive From Here.`
  String get uploadFileDescription {
    return Intl.message(
      'Upload File To Archive From Here.',
      name: 'uploadFileDescription',
      desc: '',
      args: [],
    );
  }

  /// `Adding Pages`
  String get addingPages {
    return Intl.message(
      'Adding Pages',
      name: 'addingPages',
      desc: '',
      args: [],
    );
  }

  /// `The Pages To Add New Data In System.`
  String get addingPagesDescription {
    return Intl.message(
      'The Pages To Add New Data In System.',
      name: 'addingPagesDescription',
      desc: '',
      args: [],
    );
  }

  /// `View Data`
  String get viewData {
    return Intl.message(
      'View Data',
      name: 'viewData',
      desc: '',
      args: [],
    );
  }

  /// `Search for Data In The Archive.`
  String get viewDataDescription {
    return Intl.message(
      'Search for Data In The Archive.',
      name: 'viewDataDescription',
      desc: '',
      args: [],
    );
  }

  /// `View Data With Range`
  String get viewDataWithRange {
    return Intl.message(
      'View Data With Range',
      name: 'viewDataWithRange',
      desc: '',
      args: [],
    );
  }

  /// `Search for Data In The Archive With Specific Range Of Years.`
  String get viewDataRangeDescription {
    return Intl.message(
      'Search for Data In The Archive With Specific Range Of Years.',
      name: 'viewDataRangeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message(
      'Dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Logout from app`
  String get logoutDescription {
    return Intl.message(
      'Logout from app',
      name: 'logoutDescription',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get confirmationLogoutAsk {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'confirmationLogoutAsk',
      desc: '',
      args: [],
    );
  }

  /// `Select the number of section`
  String get selectNumberOfSection {
    return Intl.message(
      'Select the number of section',
      name: 'selectNumberOfSection',
      desc: '',
      args: [],
    );
  }

  /// `Digital Archive`
  String get digitalArchive {
    return Intl.message(
      'Digital Archive',
      name: 'digitalArchive',
      desc: '',
      args: [],
    );
  }

  /// `Please select the previous information`
  String get pleaseSelectPre {
    return Intl.message(
      'Please select the previous information',
      name: 'pleaseSelectPre',
      desc: '',
      args: [],
    );
  }

  /// `There are no data`
  String get notHaveData {
    return Intl.message(
      'There are no data',
      name: 'notHaveData',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this file?`
  String get confirmDeleteMessage {
    return Intl.message(
      'Are you sure you want to delete this file?',
      name: 'confirmDeleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
