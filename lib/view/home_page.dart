import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/color.dart';
import '../controller/constants.dart';
import '../controller/utils/my_floating_action_button.dart';
import '../view/widget/MyCupertinoAlertDialog.dart';
import '../view/widget/my_appbar.dart';
import '../view/widget/my_text.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //var
    double totalWidth = MediaQuery.of(context).size.width;

    //show dialog
    Future showDialogOnClick(int index) {
      return showDialog(
        barrierDismissible: false,
        context: context,
        child: MyCupertinoAlertDialog(
          context: context,
          index: index,
        ),
      );
    }

    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
      ),
      body: Center(
        child: Container(
          width: totalWidth * 0.9,
          child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Card(
                  elevation: elevationCard,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusDefault),
                  ),
                  shadowColor: indigo,
                  child: Center(
                    child: MyText(
                      data: "Item $index",
                      colorShadow: transparent,
                    ),
                  ),
                ),
                onTap: () {
                  showDialogOnClick(index);
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(
        icon: Icons.add,
        onPressed: null,
      ),
    );
  }
}
