import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:senior_demo/sign_in_up/user.dart';
import 'package:sqflite/sqflite.dart';



class UserDatabase {
  static String? path;
  static const _databaseName = "mydb.db";
  static const _databaseVersion = 1;
  static const _table_logins = 'logins';

  UserDatabase._privateConstructor();
  static final UserDatabase instance = UserDatabase._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE users(id INTEGER PRIMARY KEY autoincrement, name TEXT, email TEXT, password TEXT, mobile TEXT)",
    );
    await db.execute(
      "CREATE TABLE logins(name TEXT, email TEXT, mobile TEXT,password TEXT)",
    );
  }

  static Future getFileData() async {
    return getDatabasesPath().then((s) {
      return path = s;
    });
  }

  Future insertUser(User user) async {
    Database db = await instance.database;

    var users =
        await db.rawQuery("select * from users where mobile = " + user.mobile);
    if (users.isNotEmpty) {
      return -1;
    }
    return await db.insert("users", user.toUserMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future checkUserLogin(String email, String password) async {
    Database db = await instance.database;
    var res = await db.rawQuery(
        "select * from users where email = '$email' and password = '$password'");
    if (res.isNotEmpty) {
      List list = res.toList().map((c) => User.fromMap(c)).toList();

      print("Data " + list.toString());
      await db.insert("logins", list[0].toUserMap());
      return list[0];
    }
    return null;
  }

  Future getUser() async {
    Database db = await instance.database;
    var logins = await db.rawQuery("select * from logins");
    return logins.length;
  }

  Future getUserData() async {
    Database db = await instance.database;
    var res = await db.rawQuery("select * from logins");
    // print("result user data $res");
    print("result user data " + res.toString());
    List list = res.toList().map((c) => User.fromMap(c)).toList();
    return list[0];
  }

  Future deleteUser(String mobile) async {
    Database db = await instance.database;
    var logins =
        db.delete(_table_logins, where: "mobile = ?", whereArgs: [mobile]);

    return logins;
  }
}
