import 'package:get/get.dart';

import '../controllers/read_document_controller.dart';

class ReadDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadDocumentController>(
      () => ReadDocumentController(),
    );
  }
}
