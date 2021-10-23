import 'package:get/get.dart';

import '../controllers/detail_document_controller.dart';

class DetailDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDocumentController>(
      () => DetailDocumentController(),
    );
  }
}
