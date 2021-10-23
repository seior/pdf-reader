import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Reader'),
        centerTitle: true,
      ),
      body: Obx(
        () => (controller.documents.length < 1)
            ? Center(
                child: Center(child: Text('Document kosong')),
              )
            : SizedBox(
                height: Get.height,
                width: Get.width,
                child: ListView.builder(
                  itemCount: controller.documents.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.picture_as_pdf,
                        color: Colors.red,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(
                      controller.documents[index].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      controller.documents[index].path,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: DropdownButton<String>(
                      icon: Icon(Icons.more_vert),
                      underline: DropdownButtonHideUnderline(
                        child: Container(),
                      ),
                      items: <String>['Open', 'Delete', 'Details']
                          .map(
                            (option) => DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        switch (value) {
                          case 'Open':
                            controller.readDocumentFromList(index);
                            break;
                          case 'Delete':
                            controller.deleteFromList(context, index);
                            break;
                          case 'Details':
                            break;
                        }
                      },
                    ),
                    onTap: () => controller.readDocumentFromList(index),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.readDocumentFromLocal(),
        child: Icon(
          Icons.folder,
        ),
      ),
    );
  }
}
