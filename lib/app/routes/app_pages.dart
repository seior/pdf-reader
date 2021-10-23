import 'package:get/get.dart';

import 'package:pdfreader/app/modules/home/bindings/home_binding.dart';
import 'package:pdfreader/app/modules/home/views/home_view.dart';
import 'package:pdfreader/app/modules/read_document/bindings/read_document_binding.dart';
import 'package:pdfreader/app/modules/read_document/views/read_document_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.READ_DOCUMENT,
      page: () => ReadDocumentView(),
      binding: ReadDocumentBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
