// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeerModel _$BeerModelFromJson(Map<String, dynamic> json) {
  return BeerModel(json['name'] as String, json['description'] as String,
      json['image_url'] as String);
}

Map<String, dynamic> _$BeerModelToJson(BeerModel instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl
    };
