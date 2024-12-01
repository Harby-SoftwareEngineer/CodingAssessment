// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_query_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartQueryDto _$CartQueryDtoFromJson(Map<String, dynamic> json) => CartQueryDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CartQueryDtoToJson(CartQueryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
    };
