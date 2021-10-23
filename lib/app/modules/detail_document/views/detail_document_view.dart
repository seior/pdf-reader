import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_document_controller.dart';

class DetailDocumentView extends GetView<DetailDocumentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  child: Icon(
                    Icons.picture_as_pdf_outlined,
                    color: Colors.red,
                    size: 150,
                  ),
                ),
              ),
              Text(
                Get.arguments.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 12),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.folder, size: 40),
                      title: Text('Path'),
                      subtitle: Text(Get.arguments.path),
                    ),
                    ListTile(
                      leading: Icon(Icons.text_snippet, size: 40),
                      title: Text('Size'),
                      subtitle: Text(
                        (int.parse(Get.arguments.size) < 1000000)
                            ? (int.parse(Get.arguments.size) / 1000).toString() + ' kb'
                            : (int.parse(Get.arguments.size) / 1000000).toString() + ' mb',
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2)
            ],
          ),
        ));
  }
}
