import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ConversationModel {
  String? message;
  bool? senderSelf;
  String? createdAt;

  ConversationModel({
    this.message,
    this.senderSelf,
    this.createdAt,
  });

  // converting to dart object from server json file
  factory ConversationModel.fromJson(Map<String, dynamic> json) => ConversationModel(
        message: json["message"],
        senderSelf: json["senderSelf"],
        createdAt: json["createdAt"]
      );

  // converting to json format from dart object
  Map<String, dynamic> toJson() => {
        "message": message,
        "senderSelf": senderSelf,
        "createdAt": createdAt,

      };
}