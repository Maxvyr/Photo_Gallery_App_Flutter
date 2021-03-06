import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/database_client.dart';
import '../models/itemPhoto.dart';
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
  List<ItemPhoto> images = [];

  @override
  void initState() {
    super.initState();
    //recover data
    _recoverData();
  }

  @override
  Widget build(BuildContext context) {
    //var
    double totalWidth = MediaQuery.of(context).size.width;

    //show dialog
    Future showDialogOnClick({
      @required ItemPhoto image,
      @required int index,
    }) {
      return showDialog(
        barrierDismissible: true,
        context: context,
        child: MyCupertinoAlertDialog(
            context: context,
            photo: image,
            onPressDelete: () => deleteImage(image)),
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
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
              crossAxisSpacing: axisSpacing,
              mainAxisSpacing: axisSpacing,
            ),
            itemBuilder: (BuildContext context, int position) {
              ItemPhoto image = images[position];
              //if list vide return Nothing
              //else return list
              if (images.isEmpty) {
                print(images.length);
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
                        File(image.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showDialogOnClick(
                      image: image,
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
        onPressed: () => openCamera(images, ImageSource.camera),
      ),
    );
  }

  //delete picture from the db and update the list show
  void deleteImage(ItemPhoto image) {
    DataBaseClient()
        .deleteItem(image.id, "photoList")
        .then((value) => _recoverData());
  }

  //add picture takes to the list
  Future openCamera(List<ItemPhoto> images, ImageSource source) async {
    ImagePicker picker = ImagePicker();
    final image = await picker.getImage(source: source);
    setState(() {
      if (image != null) {
        var photoTakes = File(image.path);
        print("list length before => ${images.length}");
        print("path pictures => $photoTakes");
        // imagesFromCamera.add(photoTakes);
        stockValue(image.path);
      } else {
        print("No image to add");
      }
    });
  }

  void stockValue(String imagePath) {
    ItemPhoto item = ItemPhoto();
    Map<String, dynamic> map = {"image": imagePath};
    item.fromMap(map);
    DataBaseClient().upsertItem(item).then((value) => _recoverData());
  }

  void _recoverData() {
    DataBaseClient().readAllItem().then((itemListRecover) {
      setState(() {
        this.images = itemListRecover;
        print("list length after => ${images.length}");
      });
    });
  }
}
