import 'package:pdfreader/app/data/models/document.dart';

abstract class DocumentRepository {
  Future<int> create(Document document);
  Future<int> delete(int id);
  Future<Document> get(int id);
  Future<List<Document>> getAll();
}
