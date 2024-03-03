import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQL{
  init_db() async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath,'finder.db');
    print(path);
    Database mydb = await openDatabase(path,onCreate: _onCreate,version: 11,onUpgrade: _onUpgrade);
    return mydb;
  }
  _onCreate(Database db, int version) async{
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE "jobs"(
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "name" TEXT NOT NULL,
        "company_name" TEXT NOT NULL,
        "location" TEXT NOT NULL,
        "image" TEXT NOT NULL,
        "saved" NUMBER NOT NULL
      )
     ''');

    await batch.commit();
    print('on create--------------------------------------------');
  }
  delete_database() async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath,'finder.db');
    await deleteDatabase(path);
  }
  _onUpgrade(Database db,int oldVersion,newVersion){
    print("on upgrade-------------------------------------------------------");
  }
  Database? _db;
  Future<Database?> get db async{
    if(_db == null){
      _db = await init_db();
      return _db;
    }else{
      return _db;
    }
  }
  insert_data(String sql) async {
    Database? mydb = await db;
    await mydb!.rawInsert(sql);
  }

  delete_data(String sql) async {
    Database? mydb = await db;
    await mydb!.rawDelete(sql);
  }

  update_data(String sql) async {
    Database? mydb = await db;
    await mydb!.rawUpdate(sql);
  }

  show_data(String sql) async {
    Database? mydb = await db;
    List<Map> data = await mydb!.rawQuery(sql);
    return data;
  }



}