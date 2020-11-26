class ItemPhoto {
  //déclaration variable
  int id;
  var image;

  //Contructor
  ItemPhoto();

  //methode for recover form the database (table)
  void fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.image = map["image"];
  }

  //methode for push to database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"image": this.image};
    if (id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}
