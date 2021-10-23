import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:get/get.dart';

class ReadDocumentController extends GetxController {
  Future<PDFDocument> readDocument(String path) async {
    return await PDFDocument.fromFile(File(path));
  }
}
