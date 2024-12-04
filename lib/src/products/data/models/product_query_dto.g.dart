// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_query_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductQueryDto _$ProductQueryDtoFromJson(Map<String, dynamic> json) =>
    ProductQueryDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      description: json['description'] as String?,
      images: json['images'] as String?,
      creationAt: json['creationAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$ProductQueryDtoToJson(ProductQueryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
      'category': instance.category,
    };
