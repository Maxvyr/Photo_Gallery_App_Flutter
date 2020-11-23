import 'dart:io';

import 'package:gallery_photo_flutter/models/database_client.dart';
import 'package:gallery_photo_flutter/models/itemPhoto.dart';

//stock value in DB
void stockValuedb(List<File> listImage) {
  ItemPhoto item = ItemPhoto();
  Map<String, dynamic> map = {"filePath": listImage};
  item.fromMap(map);
  //TODO update data
  // DataBaseClient().upsertItem(item).then((value) => recoverData());
}

// void recoverData() {
//   DataBaseClient().readAllItem().then((itemListRecover) {
//     setState(() {
//        itemPhotos
//     });
//   });
// }
