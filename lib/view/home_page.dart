import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/color.dart';
import '../controller/constants.dart';
import 'widget/my_floating_action_button.dart';
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
  //var
  bool listIsEmpty;
  ImagePicker picker = ImagePicker();
  List<File> imagesFromCamera = [];

  //add picture takes to the list
  Future startCameraPage() async {
    var cameraPhoto = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if (cameraPhoto != null) {
        var photoTaking = File(cameraPhoto.path);
        print("list length before => ${imagesFromCamera.length}");
        print(" path pictures => $photoTaking");
        imagesFromCamera.add(photoTaking);
        print("list length after => ${imagesFromCamera.length}");
      } else {
        print("No image to add");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //var
    double totalWidth = MediaQuery.of(context).size.width;

    //show dialog
    Future showDialogOnClick({
      @required List<File> images,
      @required int index,
    }) {
      return showDialog(
        barrierDismissible: true,
        context: context,
        child: MyCupertinoAlertDialog(
          context: context,
          index: index,
          images: images,
        ),
      );
    }

    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
      ),
      body: Center(
        child: Container(
          width: totalWidth * 0.92,
          child: GridView.builder(
            itemCount: imagesFromCamera.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
              crossAxisSpacing: axisSpacing,
              mainAxisSpacing: axisSpacing,
            ),
            itemBuilder: (BuildContext context, int position) {
              //if list vide return Nothing
              //else return list
              if (imagesFromCamera.isEmpty) {
                print(imagesFromCamera.length);
                return Center(
                  child: MyText(
                    data: "No Images",
                    fontSize: 50.0,
                  ),
                );
              } else {
                return GestureDetector(
                  child: Card(
                    elevation: elevationCard,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadiusDefault),
                    ),
                    shadowColor: indigo,
                    //path to find image in list
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadiusDefault),
                      child: Image.file(
                        imagesFromCamera[position],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showDialogOnClick(
                      images: imagesFromCamera,
                      index: position,
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(
        icon: Icons.add,
        onPressed: startCameraPage,
      ),
    );
  }
}
