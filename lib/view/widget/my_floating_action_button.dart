import 'package:flutter/material.dart';
import '../../controller/constants.dart';

class MyFloatingActionButton extends FloatingActionButton {
  MyFloatingActionButton({@required IconData icon, @required dynamic onPressed})
      : super(
          onPressed: onPressed,
          child: Icon(
            icon,
            size: sizeIconDefault,
          ),
        );
}
