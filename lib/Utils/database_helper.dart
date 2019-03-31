import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:kitchen_assist/Model/food.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String foodTable = 'food_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'foods.db';

    // Open/create the database at a given path
    var foodDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return foodDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $foodTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  Future<List<Map<String, dynamic>>> getFoodMapList() async {
    Database db = await this.database;

    var result = await db.query(foodTable, orderBy: '$colPriority ASC');
    return result;
  }

  Future<int> insertFood(Food food) async {
    Database db = await this.database;
    var result = await db.insert(foodTable, food.toMap());
    return result;
  }

  Future<int> updateFood(Food food) async {
    var db = await this.database;
    var result = await db.update(foodTable, food.toMap(), where: '$colId = ?', whereArgs: [food.id]);
    return result;
  }

  Future<int> deleteFood(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $foodTable WHERE $colId = $id');
    return result;
  }
