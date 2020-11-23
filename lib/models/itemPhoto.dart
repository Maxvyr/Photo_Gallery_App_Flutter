class ItemPhoto {
  //déclaration variable
  int id;
  var filePath;

  //Contructor
  ItemPhoto();

  //methode for recover form the database (table)
  void fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.filePath = map["file"];
  }

  //methode for push to database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"nom": this.filePath};
    if (id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}
