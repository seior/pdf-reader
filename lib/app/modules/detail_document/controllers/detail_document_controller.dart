import 'package:get/get.dart';

class DetailDocumentController extends GetxController {
  double showSize(int size) {
    double kb = size / 1000;

    if (kb > 1000) {
      return kb / 1000;
    }

    return kb;
  }
}
