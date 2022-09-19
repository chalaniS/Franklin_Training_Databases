import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProductDBHelper{
  static final _databaseName = 'mydb.db'
  static final _datbaseVersion = 1;

  static final _table_products = 'products';
  static String path;

  ProductDBHelper._privateConstructor();

  static final ProductDBHelper instance =ProductDBHelper._privateConstructor();

  static Database _database;

  Future get database async {

      if(_database != null ) return _database;

      _database = await _initDatabase();

      return _database;
  }

  //Initialize database with local file path, db name ........
  _initDatabase()async{
    Directory fileDirectory = await getApplicationDocumentsDirectory();

    //Localstorage path/ databasename.db
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(
      path, 
      version: _datbaseVersion,
      onCreate: _onCreate);

 
  }

  //On Create for creating database ...........
  Future _onCreate(Database db, int version) async{
    await db.execute( 'CREATE TABLE $_table_products (id INTEGER PRIMARY KEY autoincrement, name TEXT, value INTEGER, num REAL)');
  }

  static Future getFileData() async{
    return getDatabasesPath().then((value) {
      return path = value;
    });
  }

  Future insertProduct(Product product) async{
    Database db = await instance .database;
    return await db.insert(_table_products, Product.toMap(product),
    conflictAlgorithm: ConflictAlgorithm.ignore
    );
  }

  Future<List<Product>> getProductsList() async{
    Database db = await instance.database;
    List<Map> maps = await db.query(_table_products);
    print(maps);

    return Product.fromMapList(maps);
  }


}