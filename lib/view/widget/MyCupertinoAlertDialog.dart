import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_photo_flutter/models/itemPhoto.dart';
import '../../controller/color.dart';
import '../../controller/constants.dart' as constant;

import 'my_text.dart';

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
                Navigator.of(context).pop();
              },
              child: MyText(
                //TODO implement share
                data: constant.validate,
                colorShadow: transparent,
              ),
            ),
            FlatButton(
              onPressed: () {
                onPressDelete();
                Navigator.of(context).pop();
              },
              child: MyText(
                data: constant.delete,
                colorShadow: transparent,
              ),
            ),
          ],
        );
}
