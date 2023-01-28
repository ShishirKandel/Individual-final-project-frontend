import 'package:json_annotation/json_annotation.dart';

class OutletModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  double? lat;
  double? lng;

  OutletModel({
    this.id,
    this.lat,
    this.lng,
    this.name,
  });

  // converting to dart object from server json file
  factory OutletModel.fromJson(Map<String, dynamic> json) => OutletModel(
        id: json["_id"],
        lat: json["lat"],
        lng: json["lng"],
        name: json["name"],
      );

  // converting to json format from dart object
  Map<String, dynamic> toJson() => {
        "_id": id,
        "lat": lat,
        "lng": lng,
        "name": name,
      };
}
