import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/read_document_controller.dart';

class ReadDocumentView extends GetView<ReadDocumentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.parameters['name']!),
      ),
      body: FutureBuilder<PDFDocument>(
        future: controller.readDocument(Get.parameters['path']!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PDFViewer(document: snapshot.data!);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
