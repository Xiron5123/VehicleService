// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      type: json['type'] as String,
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      availableTimeSlots: (json['availableTimeSlots'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimatedDuration: (json['estimatedDuration'] as num).toInt(),
      isAvailable: json['isAvailable'] as bool,
      process:
          (json['process'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'type': instance.type,
      'features': instance.features,
      'availableTimeSlots': instance.availableTimeSlots,
      'estimatedDuration': instance.estimatedDuration,
      'isAvailable': instance.isAvailable,
      'process': instance.process,
    };

_$TimeSlotImpl _$$TimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotImpl(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$$TimeSlotImplToJson(_$TimeSlotImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'isAvailable': instance.isAvailable,
    };
