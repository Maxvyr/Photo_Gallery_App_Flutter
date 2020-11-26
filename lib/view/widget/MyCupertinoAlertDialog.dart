import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_photo_flutter/models/itemPhoto.dart';
import 'package:share/share.dart';
import '../../controller/constants.dart' as constant;

class MyCupertinoAlertDialog extends CupertinoAlertDialog {
  MyCupertinoAlertDialog({
    @required BuildContext context,
    @required ItemPhoto photo,
    VoidCallback onPressDelete,
  }) : super(
          content: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(constant.borderRadiusDefault),
                child: Image.file(
                  File(photo.imagePath),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Share.shareFiles([photo.imagePath],
                    text: "Great Picture, "
                        "share them for your pleasure");
                Navigator.of(context).pop();
              },
              child: Icon(Icons.share),
            ),
            FlatButton(
              onPressed: () {
                onPressDelete();
                Navigator.of(context).pop();
              },
              child: Icon(Icons.delete_forever),
            ),
          ],
        );
}
