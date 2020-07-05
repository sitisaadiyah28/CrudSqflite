
import 'package:sqflite/sqflite.dart';
import 'package:crud_sqflite/model/model_mahasiswa.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  final String tableMahasiswa = 'noteTable';
  final String columId = 'id';
  final String columnFullname = 'fullname';
  final String columnAlamat = 'alamat';
  final String columnNotelp = 'notelp';
  final String columnEmail = 'email';
  final String columnPassword = 'password';

  static Database _db;
  DatabaseHelper.internal();
  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mahasiswa.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db, int NewViersion) async{
    await db.execute("CREATE TABLE $tableMahasiswa($columId INTEGER PRIMARY KEY, $columnFullname TEXT, $columnAlamat TEXT, $columnNotelp TEXT, $columnEmail TEXT, $columnPassword TEXT )");

  }

  Future<List> getLogin(String email, String password) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT $columnEmail, $columnPassword FROM $tableMahasiswa WHERE $columnEmail= '$email' and $columnPassword = '$password'");

    if(result.length > 0){
      return result;
    }
    return null;
  }

  //Save Mahasiswa
  Future<int> saveMahasiswa(ModelMahasiswa mahasiswa) async{
    var dbClient = await db;
    var result = await dbClient.insert(tableMahasiswa,mahasiswa.toMap());
    return result;
  }

  //Get All Mahasiswa
  Future<List> getAllMahasiswa() async{
    var dbClient = await db;
    var result = await dbClient.query(tableMahasiswa, columns: [
      columId,
      columnFullname,
      columnAlamat,
      columnNotelp,
      columnEmail
    ]);
    return result.toList();
  }

  //Update Mahasiswa
  Future<int> updateMahasiswa(ModelMahasiswa mahasiswa) async{
    var dbClient = await db;
    return await dbClient.update(tableMahasiswa, mahasiswa.toMap(),
        where: "$columId = ?", whereArgs: [mahasiswa.id]);
  }

  //Delete Mahasiswa
  Future<int> deleteMahasiswa(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableMahasiswa, where: "$columId = ?", whereArgs: [id]);
  }


}