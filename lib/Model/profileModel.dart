import 'package:json_annotation/json_annotation.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  String name;
  String username;
  String email;
  String DOB;
  String gender;
  String weight;
  ProfileModel({
    this.DOB,
    this.name,
    this.email,
    this.username,
    this.gender,
    this.weight,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
