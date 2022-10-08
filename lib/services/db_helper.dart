// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:demolocaldatabase/app/utills/app_logs.dart';
import 'package:demolocaldatabase/model/register_model.dart';
import 'package:demolocaldatabase/model/user_register_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._instance();
  static Database? _db;

  DBHelper._instance();

  static const String dbName = 'DemoLocalDatabase';

  //     ======================= Add Register Business Data Table =======================     //
  static const String registerBusinessTypeUserTable = 'business';
  static const String registerBusinessUserId = 'registerBusinessUserId';
  static const String registerBusinessFirstName = 'businessFirstName';
  static const String registerBusinessLastName = 'businessLastName';
  static const String registerBusinessEmail = 'businessEmail';
  static const String registerBusinessType = 'businessType';
  static const String registerBusinessEstDate = 'businessEstDate';
  static const String registerBusinessName = 'businessName';
  static const String registerBusinessAddress = 'businessAddress';
  static const String registerBusinessCountry = 'businessCountry';
  static const String registerBusinessState = 'businessState';
  static const String registerBusinessCity = 'businessCity';
  static const String registerBusinessLandlineNo = 'businessLandlineNo';
  static const String registerBusinessMobileNo = 'businessMobileNo';
  static const String registerBusinessUserName = 'businessUserName';
  static const String registerBusinessPassword = 'businessPassword';
  static const String registerBusinessConfirmPassword = 'businessConfirmPassword';
  static const String endUsersTable = 'end_users';
  static const String userId = 'userId';
  static const String userFirstName = 'userFirstName';
  static const String userLastName = 'userLastName';
  static const String userEmail = 'userEmail';
  static const String userDob = 'userDob';
  static const String userAddress = 'userAddress';
  static const String userCountry = 'userCountry';
  static const String userState = 'userState';
  static const String userCity = 'userCity';
  static const String userMobileNo = 'userMobileNo';
  static const String userUserName = 'userUserName';
  static const String userPassword = 'userPassword';
  static const String userConfirmPassword = 'userConfirmPassword';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    } else {
      logs('Database Name : $_db');
      logs('Database Check : ${_db!.isOpen}');
    }
    return _db;
  }

  _initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbName);
    final db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $registerBusinessTypeUserTable ($registerBusinessUserId integer primary key autoincrement, $registerBusinessFirstName TEXT,$registerBusinessLastName TEXT,$registerBusinessEmail TEXT,'
        '$registerBusinessType TEXT,$registerBusinessEstDate TEXT,$registerBusinessName TEXT,$registerBusinessAddress TEXT,$registerBusinessCountry TEXT,$registerBusinessState TEXT,$registerBusinessCity TEXT,$registerBusinessLandlineNo TEXT,'
        '$registerBusinessMobileNo TEXT,$registerBusinessUserName TEXT,$registerBusinessPassword TEXT,$registerBusinessConfirmPassword TEXT)');
    await db.execute('CREATE TABLE $endUsersTable ($userId integer primary key autoincrement, $userFirstName Text, $userLastName Text, $userEmail Text, $userDob Text, $userAddress Text, $userCountry Text, $userState Text, $userCity Text, $userMobileNo Text, $userUserName Text, $userPassword Text)');
  }

  Future<int> addBusinessTypeUserTable(BusinessRegisterModel registerModel) async {
    Database? dbClient = await db;
    final int result = await dbClient!.insert(registerBusinessTypeUserTable, registerModel.toJson());
    logs('Add register User result : $result');
    return result;
  }

  Future<int> registerEndUsers(UserRegisterModel userRegisterModel) async {
    Database? dbClient = await db;
    final int result = await dbClient!.insert(endUsersTable, userRegisterModel.toJson());
    logs('Register end user : $result');
    return result;
  }

  Future<List<Map<String, dynamic>>> getBusinessTypeUserTable() async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.query(registerBusinessTypeUserTable);
    logs('Get register user result : $result');
    return result;
  }

  Future<List<Map<String, dynamic>>> getEndUsers() async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.query(endUsersTable);
    logs('End users map : $result');
    return result;
  }

  //     ======================= Delete Database =======================     //
  Future<void> deleteDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbName);
    return databaseFactory.deleteDatabase(path);
  }
}
