// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      creationAt: json['creationAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      category: json['category'] == null
          ? null
          : CategoryDto.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
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
