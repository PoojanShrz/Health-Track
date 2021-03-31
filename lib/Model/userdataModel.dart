import 'package:json_annotation/json_annotation.dart';

part 'userdataModel.g.dart';

@JsonSerializable()
class UserDataModel {
  String bloodpressure;
  String calories;
  String water;
  String bloodglucose;
  String height;
  UserDataModel({
    this.bloodpressure,
    this.calories,
    this.water,
    this.bloodglucose,
    this.height,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
