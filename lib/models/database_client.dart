import 'dart:io';
import 'dart:core';

import 'package:gallery_photo_flutter/models/itemPhoto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'itemPhoto.dart';

class DataBaseClient {
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      //retourne la database
      return _database;
    } else {
      //créer la database et la retourne
      _database = await create();
      return _database;
    }
  }

  Future create() async {
    //recup chemin docu de l'app
    Directory directory = await getApplicationDocumentsDirectory();
    // ajouter le chemin de la db
    String dataBaseDirectory = "${directory.path}/database.db";
    var bdd =
        await openDatabase(dataBaseDirectory, version: 1, onCreate: _onCreate);
    return bdd;
  }

  //command en sql pour créer ma base de données
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE photoList(
        id INTEGER PRIMARY KEY,
        image TEXT NOT NULL
      )
      ''');
  }

  //Ecritue des data

  Future<ItemPhoto> insertItem(ItemPhoto item) async {
    Database myDatabase = await database;
    // on ajoute a la table a appler item un valeur a l'id déja existant
    // que l'on récup avec la méthode toMap de item
    item.id = await myDatabase.insert("photoList", item.toMap());
    return item;
  }

  Future<int> updateItem(ItemPhoto item) async {
    Database myDatabase = await database;
    // dans la table 'item'
    // la valeur de item.toMap
    // le where c'est on cherche la colonne id de cette table
    // whereargs dans cette colonne on trouve l'arg id de param
    // et donc on update la ligne avec ce id de la table
    return myDatabase.update("photoList", item.toMap(),
        where: "id = ?", whereArgs: [item.id]);
  }

  //Update or Insert also call upsert
  Future<ItemPhoto> upsertItem(ItemPhoto item) async {
    Database myDatabase = await database;
    // if item == null insert new line in database
    // else update value at the good position
    if (item.id == null) {
      print("add new item to the db");
      item.id = await myDatabase.insert("photoList", item.toMap());
    } else {
      print("update item in the db");
      myDatabase.update("photoList", item.toMap(),
          where: "id = ?", whereArgs: [item.id]);
    }
    return item;
  }

  Future<int> deleteItem(int id, String table) async {
    Database myDatabase = await database;
    // dans la table appele en param
    // le where c'est on cherche la colonne id de cette table
    // whereargs dans cette colonne on trouve l'arg id de param
    // et donc on suppr la ligne avec ce id de la table
    print("delete item in th db");
    return await myDatabase.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  //Lecture des data

  Future<List<ItemPhoto>> readAllItem() async {
    Database myDatabase = await database;
    // on récupère tout les composant de la list item (SELECT *)
    List<Map<String, dynamic>> resultat =
        await myDatabase.rawQuery("SELECT * from photoList");
    // créer list d'item vide
    // boucle sur toute la liste de map qui a recup ma database
    // dans la boucle a chaque ligne
    // * crée un item
    // * appel sa méthode fromMap pour affecter les valeurs de la map a chaque variable de l'item
    // * ajoute a la liste
    // a la fin de la boucle on retourne la liste d'items
    List<ItemPhoto> items = [];
    resultat.forEach((map) {
      ItemPhoto item = ItemPhoto();
      item.fromMap(map);
      items.add(item);
    });
    return items;
  }
}
