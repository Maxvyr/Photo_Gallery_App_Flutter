import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/color.dart';
import '../../controller/constants.dart';

import 'my_text.dart';

class MyCupertinoAlertDialog extends CupertinoAlertDialog {
  MyCupertinoAlertDialog({
    @required BuildContext context,
    @required int index,
    @required List<File> images,
  }) : super(
          content: Column(
            children: <Widget>[
              // MyText(
              //   data: "Position Picture $index",
              //   colorShadow: transparent,
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadiusDefault),
                child: Image.file(
                  images[index],
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
                data: validate,
                colorShadow: transparent,
              ),
            )
          ],
        );
}
