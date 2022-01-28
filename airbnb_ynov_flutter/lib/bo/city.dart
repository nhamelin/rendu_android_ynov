class City {
  String name;
  String pic;

  City(this.name, this.pic);

  City.fromJson(Map<String, dynamic> json) :
    name = json["name"],
    pic = json["pic"]["url"];

  Map<String, dynamic> toJson() => {
    "name": name,
    "pic": pic
  };
}