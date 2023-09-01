import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('favorite.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites(
        id INTEGER PRIMARY KEY,
        productId INTEGER,
        title TEXT,
        price REAL,
        image TEXT
      )
    ''');
  }

  final _favoriteNotifier = ValueNotifier<List<Map<String, dynamic>>>([]);

  ValueListenable<List<Map<String, dynamic>>> get favoriteNotifier =>
      _favoriteNotifier;

  Future<int> insertFavorite(Map<String, dynamic> product) async {
    final db = await instance.database;
    final id = await db.insert('favorites', product);
    _updateFavorites();
    return id;
  }

  Future<List<Map<String, dynamic>>> getAllFavorites() async {
    final db = await instance.database;
    return await db.query('favorites');
  }

  Future<bool> isFavorite(int productId) async {
    final db = await instance.database;
    final result = await db.query(
      'favorites',
      where: 'productId = ?',
      whereArgs: [productId],
    );
    return result.isNotEmpty;
  }

  Future<int> deleteFavorite(int productId) async {
    final db = await instance.database;
    final result = await db.delete(
      'favorites',
      where: 'productId = ?',
      whereArgs: [productId],
    );
    _updateFavorites();
    return result;
  }

  Future<void> _updateFavorites() async {
    final loadedFavorites = await getAllFavorites();
    _favoriteNotifier.value = loadedFavorites;
  }

}