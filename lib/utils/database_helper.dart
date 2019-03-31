import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:kitchen_assist/Models/Food.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String foodTable = 'food_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance();
  final DatabaseHelper instance = DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'food.db';
    //open//create database
    var foodDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return foodDatabase;
  }

  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $foodTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,''$colDescription TEXT, $colPriority INTEGER, $colDate Text)');
  }

  Future<List<Map<String, dynamic>>> getFoodMapList() async{
    Database db = await this.database;
    var result = await db.query(foodTable, orderBy: '$colPriority ASC');
    return result;
  }

  Future<int> insertItem(Food food) async{
    var db = await this.database;
    var result = await db.update(foodTable, food.toMap());
    return result;
  }

  Future<int> updateFood(Food food) async{
    var db = await this.database;
    var result = await db.update(foodTable, food.toMap(), where: '$colId = ?', whereArgs: [food.id]);
    return result;
  }

  Future<int> deleteItem(int id) async{
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $foodTable WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $foodTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}