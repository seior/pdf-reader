import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdfreader/app/data/models/document.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseUtils {
  DatabaseUtils._privateConstructor();

  static final DatabaseUtils instance = DatabaseUtils._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, 'pdfreader.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE $documentTable (
        id INTEGER PRIMARY KEY,
        name TEXT,
        path TEXT,
        size TEXT
      )
    ''');
      },
    );
  }
}
