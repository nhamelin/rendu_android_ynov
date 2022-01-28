import 'package:airbnb_ynov_flutter/bo/city.dart';

class Housing {
  City place;
  String title;
  num price;
  String owner;
  double lat;
  double lng;

  Housing(
      this.place, this.title, this.price,
      this.owner, this.lat, this.lng
  );

  Housing.fromJson(Map<String, dynamic> json) :
    place = City.fromJson(json["place"]),
    title = json["title"],
    price = json["price"],
    owner = json["owner"],
    lat = json["lat"],
    lng = json["lng"];

  Map<String, dynamic> toJson() => {
    "place": place.toJson(),
    "title": title,
    "price": price,
    "owner": owner,
    "lat": lat,
    "lng": lng,
  };
}