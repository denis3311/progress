import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _database;

  // Singleton pattern for DbHelper
  static Future<Database> get database async {
    if (_database != null) return _database!;

    // If database is null, we create it
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'pogress.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE workouts(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            sets INTEGER,
            reps INTEGER,
            weight REAL,
            date TEXT
          );
        ''');
        db.execute('''
          CREATE TABLE food(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            fat REAL,
            carbs REAL,
            protein REAL,
            date TEXT
          );
        ''');
        db.execute('''
          CREATE TABLE weight(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            value REAL,
            date TEXT
          );
        ''');
      },
      version: 1,
    );
  }

  // Insert a record into a table
  static Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data);
  }

  // Get all records from a table
  static Future<List<Map<String, dynamic>>> getAll(String table) async {
    final db = await database;
    return await db.query(table);
  }

  // Update a record
  static Future<int> update(String table, Map<String, dynamic> data, int id) async {
    final db = await database;
    return await db.update(
      table,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete a record
  static Future<int> delete(String table, int id) async {
    final db = await database;
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
