import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfreader/app/data/models/document.dart';
import 'package:pdfreader/app/data/repository/impl/document_repository_impl.dart';
import 'package:pdfreader/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxList<Document> documents = <Document>[].obs;

  @override
  onInit() async {
    documents.value = await DocumentRepositoryImpl().getAll();
    super.onInit();
  }

  Future<void> readDocumentFromLocal() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      DocumentRepositoryImpl().create(Document(
          name: result.files.single.name, path: result.files.single.path!, size: result.files.single.size.toString()));

      Get.toNamed(Routes.READ_DOCUMENT,
          parameters: {'path': result.files.single.path!, 'name': result.files.single.name});
    }

    documents.value = await DocumentRepositoryImpl().getAll();
  }

  Future<void> readDocumentFromList(int id) async {
    Document document = await DocumentRepositoryImpl().get(id);
    Get.toNamed(Routes.READ_DOCUMENT, parameters: {'path': document.path, 'name': document.name});
  }

  void deleteFromList(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete'),
        content: Text('Delete file from list ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () async {
              await DocumentRepositoryImpl().delete(id);

              documents.value = await DocumentRepositoryImpl().getAll();

              Navigator.of(context).pop();
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }
}
