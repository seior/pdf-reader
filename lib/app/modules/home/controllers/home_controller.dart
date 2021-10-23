import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfreader/app/data/models/document.dart';
import 'package:pdfreader/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxList<Document> documents = <Document>[].obs;

  Future<void> readDocumentFromLocal() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      documents.add(Document(
          name: result.files.single.name, path: result.files.single.path!, size: result.files.single.bytes.toString()));

      Get.toNamed(Routes.READ_DOCUMENT,
          parameters: {'path': result.files.single.path!, 'name': result.files.single.name});
    }
  }

  Future<void> readDocumentFromList(int id) async {
    Get.toNamed(Routes.READ_DOCUMENT, parameters: {'path': documents[id].path, 'name': documents[id].name});
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
              await documents.removeAt(id);

              Navigator.of(context).pop();
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }
}
