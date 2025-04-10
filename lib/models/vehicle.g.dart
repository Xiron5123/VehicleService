// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      type: json['type'] as String,
      transmission: json['transmission'] as String,
      fuelType: json['fuelType'] as String,
      seats: (json['seats'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      pricePerDay: (json['pricePerDay'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      isAvailable: json['isAvailable'] as bool,
      depositAmount: (json['depositAmount'] as num).toDouble(),
      requiredDocuments: (json['requiredDocuments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rentalRequirements: (json['rentalRequirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      priceDiscounts: (json['priceDiscounts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
      ),
      paymentMethods: (json['paymentMethods'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rentalTerms: Map<String, String>.from(json['rentalTerms'] as Map),
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'type': instance.type,
      'transmission': instance.transmission,
      'fuelType': instance.fuelType,
      'seats': instance.seats,
      'imageUrl': instance.imageUrl,
      'pricePerDay': instance.pricePerDay,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'features': instance.features,
      'isAvailable': instance.isAvailable,
      'depositAmount': instance.depositAmount,
      'requiredDocuments': instance.requiredDocuments,
      'rentalRequirements': instance.rentalRequirements,
      'priceDiscounts':
          instance.priceDiscounts.map((k, e) => MapEntry(k.toString(), e)),
      'paymentMethods': instance.paymentMethods,
      'rentalTerms': instance.rentalTerms,
    };
