import 'package:flutter/material.dart';
import '../../controller/color.dart';

import 'my_text.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    @required String title,
  }) : super(
          title: MyText(
            data: title,
            color: white,
            fontSize: 28.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
          ),
          centerTitle: true,
        );
}
