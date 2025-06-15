// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BottleModelImpl _$$BottleModelImplFromJson(Map<String, dynamic> json) =>
    _$BottleModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: json['price'] as String?,
      distillery: json['distillery'] as String?,
      country: json['country'] as String?,
      type: json['type'] as String?,
      bottler: json['bottler'] as String?,
      cask: json['cask'] as String?,
      abv: json['abv'] as String?,
      age: json['age'] as String?,
    );

Map<String, dynamic> _$$BottleModelImplToJson(_$BottleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'distillery': instance.distillery,
      'country': instance.country,
      'type': instance.type,
      'bottler': instance.bottler,
      'cask': instance.cask,
      'abv': instance.abv,
      'age': instance.age,
    };
