import 'package:flutter/material.dart';
import '../../controller/color.dart';

class MyText extends Text {
  MyText({
    @required String data,
    color: black,
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    colorShadow: black,
  }) : super(
          //if data null replace by an empty string
          data ?? "",
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontStyle: fontStyle,
            shadows: [
              Shadow(
                color: colorShadow,
                offset: Offset(1, 1),
                blurRadius: 4.0,
              ),
            ],
          ),
        );
}
