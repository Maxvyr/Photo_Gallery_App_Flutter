import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/color.dart';
import '../../controller/constants.dart';

import 'my_text.dart';

class MyCupertinoAlertDialog extends CupertinoAlertDialog {
  MyCupertinoAlertDialog({
    @required BuildContext context,
    @required int index,
  }) : super(
          content: Column(
            children: <Widget>[
              MyText(
                data: "Selected Item $index",
                colorShadow: transparent,
              ),
              Icon(
                Icons.favorite,
                color: greenLight,
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
