// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    DOB: json['DOB'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    username: json['username'] as String,
    gender: json['gender'] as String,
    weight: json['weight'] as String,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'DOB': instance.DOB,
      'gender': instance.gender,
      'weight': instance.weight,
    };
