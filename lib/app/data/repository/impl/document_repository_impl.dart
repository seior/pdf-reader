import 'package:pdfreader/app/data/models/document.dart';
import 'package:pdfreader/app/data/repository/document_repository.dart';
import 'package:pdfreader/app/utils/database_utils.dart';
import 'package:sqflite/sqflite.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  @override
  Future<int> create(Document document) async {
    Database db = await DatabaseUtils.instance.database;

    return db.insert(documentTable, document.toMap());
  }

  @override
  Future<int> delete(int id) async {
    Database db = await DatabaseUtils.instance.database;

    return db.delete(documentTable, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<Document> get(int id) async {
    Database db = await DatabaseUtils.instance.database;

    var doc = await db.query(documentTable, where: 'id = ?', whereArgs: [id]);

    List<Document> document = doc.isNotEmpty ? doc.map((e) => Document.fromMap(e)).toList() : [];

    return document.first;
  }

  @override
  Future<List<Document>> getAll() async {
    Database db = await DatabaseUtils.instance.database;

    var doc = await db.query(documentTable, orderBy: 'id');

    List<Document> document = doc.isNotEmpty ? doc.map((e) => Document.fromMap(e)).toList() : [];

    return document;
  }
}
