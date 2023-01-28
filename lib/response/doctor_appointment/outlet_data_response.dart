
import 'package:hospital_management_system/models/outletModel.dart';

class OutletResponse {
  List<OutletModel>? details;

  OutletResponse({
    this.details,
  });

  // converting to dart object from server json file
  factory OutletResponse.fromJson(Map<String, dynamic> json) => OutletResponse(
        details: json["details"],
      );

  // converting to json format from dart object
  Map<String, dynamic> toJson() => {
        "details": details,
      };
}
