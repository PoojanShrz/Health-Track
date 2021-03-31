// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) {
  return UserDataModel(
    bloodpressure: json['bloodpressure'] as String,
    calories: json['calories'] as String,
    water: json['water'] as String,
    bloodglucose: json['bloodglucose'] as String,
    height: json['height'] as String,
  );
}

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'bloodpressure': instance.bloodpressure,
      'calories': instance.calories,
      'water': instance.water,
      'bloodglucose': instance.bloodglucose,
      'height': instance.height,
    };
