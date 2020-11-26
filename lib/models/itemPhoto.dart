class ItemPhoto {
  //déclaration variable
  int id;
  var imagePath;

  //Contructor
  ItemPhoto();

  //methode for recover form the database (table)
  void fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.imagePath = map["image"];
  }

  //methode for push to database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"image": this.imagePath};
    if (id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}
