import 'package:mini_project/model/result_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ResultHelper {
  static ResultHelper? _resultHelper;
  static late Database _database;

  ResultHelper._internal() {
    _resultHelper = this;
  }

  factory ResultHelper() => _resultHelper ?? ResultHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = 'result';

  Future<Database> _initializeDb() async {
    var db = openDatabase(join(await getDatabasesPath(), 'result_db.db'),
        onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE $_tableName(number INTEGER PRIMARY KEY, grade TEXT, subject TEXT, yourAnswer TEXT, correctAnswer TEXT, point INTEGER)''',
      );
    }, version: 1);
    return db;
  }

  Future<void> insertResult(ResultModel resultModel) async {
    final Database db = await database;
    await db.insert(_tableName, resultModel.toMap());
  }

  Future<List<ResultModel>> getContact() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);
    return result.map((e) => ResultModel.fromMap(e)).toList();
  }

  Future<ResultModel> getResultByNumber(int number) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'number = ?',
      whereArgs: [number],
    );
    return result.map((e) => ResultModel.fromMap(e)).first;
  }

  Future<void> deleteResult(int number) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'number = ?',
      whereArgs: [number],
    );
  }
}
