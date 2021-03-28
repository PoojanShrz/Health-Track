import 'package:json_annotation/json_annotation.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  String name;
  String username;
  String dob;
  String gender;
  String weight;
  ProfileModel({
    this.dob,
    this.name,
    this.username,
    this.gender,
    this.weight,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModeltoJson(this);
}
