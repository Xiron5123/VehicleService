// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get transmission => throw _privateConstructorUsedError;
  String get fuelType => throw _privateConstructorUsedError;
  int get seats => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get pricePerDay => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  bool get isAvailable =>
      throw _privateConstructorUsedError; // Thêm thông tin yêu cầu thuê xe
  double get depositAmount => throw _privateConstructorUsedError; // Số tiền cọc
  List<String> get requiredDocuments =>
      throw _privateConstructorUsedError; // Danh sách giấy tờ cần thiết
  List<String> get rentalRequirements =>
      throw _privateConstructorUsedError; // Yêu cầu khi thuê
  Map<int, double> get priceDiscounts =>
      throw _privateConstructorUsedError; // Giảm giá theo số ngày thuê
  List<String> get paymentMethods => throw _privateConstructorUsedError;
  Map<String, String> get rentalTerms => throw _privateConstructorUsedError;

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {String id,
      String name,
      String brand,
      String model,
      int year,
      String type,
      String transmission,
      String fuelType,
      int seats,
      String imageUrl,
      double pricePerDay,
      double rating,
      int reviewCount,
      List<String> features,
      bool isAvailable,
      double depositAmount,
      List<String> requiredDocuments,
      List<String> rentalRequirements,
      Map<int, double> priceDiscounts,
      List<String> paymentMethods,
      Map<String, String> rentalTerms});
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brand = null,
    Object? model = null,
    Object? year = null,
    Object? type = null,
    Object? transmission = null,
    Object? fuelType = null,
    Object? seats = null,
    Object? imageUrl = null,
    Object? pricePerDay = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? features = null,
    Object? isAvailable = null,
    Object? depositAmount = null,
    Object? requiredDocuments = null,
    Object? rentalRequirements = null,
    Object? priceDiscounts = null,
    Object? paymentMethods = null,
    Object? rentalTerms = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      transmission: null == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String,
      fuelType: null == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerDay: null == pricePerDay
          ? _value.pricePerDay
          : pricePerDay // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as double,
      requiredDocuments: null == requiredDocuments
          ? _value.requiredDocuments
          : requiredDocuments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rentalRequirements: null == rentalRequirements
          ? _value.rentalRequirements
          : rentalRequirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceDiscounts: null == priceDiscounts
          ? _value.priceDiscounts
          : priceDiscounts // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rentalTerms: null == rentalTerms
          ? _value.rentalTerms
          : rentalTerms // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
          _$VehicleImpl value, $Res Function(_$VehicleImpl) then) =
      __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String brand,
      String model,
      int year,
      String type,
      String transmission,
      String fuelType,
      int seats,
      String imageUrl,
      double pricePerDay,
      double rating,
      int reviewCount,
      List<String> features,
      bool isAvailable,
      double depositAmount,
      List<String> requiredDocuments,
      List<String> rentalRequirements,
      Map<int, double> priceDiscounts,
      List<String> paymentMethods,
      Map<String, String> rentalTerms});
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
      _$VehicleImpl _value, $Res Function(_$VehicleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brand = null,
    Object? model = null,
    Object? year = null,
    Object? type = null,
    Object? transmission = null,
    Object? fuelType = null,
    Object? seats = null,
    Object? imageUrl = null,
    Object? pricePerDay = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? features = null,
    Object? isAvailable = null,
    Object? depositAmount = null,
    Object? requiredDocuments = null,
    Object? rentalRequirements = null,
    Object? priceDiscounts = null,
    Object? paymentMethods = null,
    Object? rentalTerms = null,
  }) {
    return _then(_$VehicleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      transmission: null == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String,
      fuelType: null == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerDay: null == pricePerDay
          ? _value.pricePerDay
          : pricePerDay // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as double,
      requiredDocuments: null == requiredDocuments
          ? _value._requiredDocuments
          : requiredDocuments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rentalRequirements: null == rentalRequirements
          ? _value._rentalRequirements
          : rentalRequirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceDiscounts: null == priceDiscounts
          ? _value._priceDiscounts
          : priceDiscounts // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      paymentMethods: null == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rentalTerms: null == rentalTerms
          ? _value._rentalTerms
          : rentalTerms // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleImpl extends _Vehicle {
  const _$VehicleImpl(
      {required this.id,
      required this.name,
      required this.brand,
      required this.model,
      required this.year,
      required this.type,
      required this.transmission,
      required this.fuelType,
      required this.seats,
      required this.imageUrl,
      required this.pricePerDay,
      required this.rating,
      required this.reviewCount,
      required final List<String> features,
      required this.isAvailable,
      required this.depositAmount,
      required final List<String> requiredDocuments,
      required final List<String> rentalRequirements,
      required final Map<int, double> priceDiscounts,
      required final List<String> paymentMethods,
      required final Map<String, String> rentalTerms})
      : _features = features,
        _requiredDocuments = requiredDocuments,
        _rentalRequirements = rentalRequirements,
        _priceDiscounts = priceDiscounts,
        _paymentMethods = paymentMethods,
        _rentalTerms = rentalTerms,
        super._();

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String brand;
  @override
  final String model;
  @override
  final int year;
  @override
  final String type;
  @override
  final String transmission;
  @override
  final String fuelType;
  @override
  final int seats;
  @override
  final String imageUrl;
  @override
  final double pricePerDay;
  @override
  final double rating;
  @override
  final int reviewCount;
  final List<String> _features;
  @override
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final bool isAvailable;
// Thêm thông tin yêu cầu thuê xe
  @override
  final double depositAmount;
// Số tiền cọc
  final List<String> _requiredDocuments;
// Số tiền cọc
  @override
  List<String> get requiredDocuments {
    if (_requiredDocuments is EqualUnmodifiableListView)
      return _requiredDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredDocuments);
  }

// Danh sách giấy tờ cần thiết
  final List<String> _rentalRequirements;
// Danh sách giấy tờ cần thiết
  @override
  List<String> get rentalRequirements {
    if (_rentalRequirements is EqualUnmodifiableListView)
      return _rentalRequirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rentalRequirements);
  }

// Yêu cầu khi thuê
  final Map<int, double> _priceDiscounts;
// Yêu cầu khi thuê
  @override
  Map<int, double> get priceDiscounts {
    if (_priceDiscounts is EqualUnmodifiableMapView) return _priceDiscounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_priceDiscounts);
  }

// Giảm giá theo số ngày thuê
  final List<String> _paymentMethods;
// Giảm giá theo số ngày thuê
  @override
  List<String> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
  }

  final Map<String, String> _rentalTerms;
  @override
  Map<String, String> get rentalTerms {
    if (_rentalTerms is EqualUnmodifiableMapView) return _rentalTerms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rentalTerms);
  }

  @override
  String toString() {
    return 'Vehicle(id: $id, name: $name, brand: $brand, model: $model, year: $year, type: $type, transmission: $transmission, fuelType: $fuelType, seats: $seats, imageUrl: $imageUrl, pricePerDay: $pricePerDay, rating: $rating, reviewCount: $reviewCount, features: $features, isAvailable: $isAvailable, depositAmount: $depositAmount, requiredDocuments: $requiredDocuments, rentalRequirements: $rentalRequirements, priceDiscounts: $priceDiscounts, paymentMethods: $paymentMethods, rentalTerms: $rentalTerms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.transmission, transmission) ||
                other.transmission == transmission) &&
            (identical(other.fuelType, fuelType) ||
                other.fuelType == fuelType) &&
            (identical(other.seats, seats) || other.seats == seats) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.pricePerDay, pricePerDay) ||
                other.pricePerDay == pricePerDay) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.depositAmount, depositAmount) ||
                other.depositAmount == depositAmount) &&
            const DeepCollectionEquality()
                .equals(other._requiredDocuments, _requiredDocuments) &&
            const DeepCollectionEquality()
                .equals(other._rentalRequirements, _rentalRequirements) &&
            const DeepCollectionEquality()
                .equals(other._priceDiscounts, _priceDiscounts) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            const DeepCollectionEquality()
                .equals(other._rentalTerms, _rentalTerms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        brand,
        model,
        year,
        type,
        transmission,
        fuelType,
        seats,
        imageUrl,
        pricePerDay,
        rating,
        reviewCount,
        const DeepCollectionEquality().hash(_features),
        isAvailable,
        depositAmount,
        const DeepCollectionEquality().hash(_requiredDocuments),
        const DeepCollectionEquality().hash(_rentalRequirements),
        const DeepCollectionEquality().hash(_priceDiscounts),
        const DeepCollectionEquality().hash(_paymentMethods),
        const DeepCollectionEquality().hash(_rentalTerms)
      ]);

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(
      this,
    );
  }
}

abstract class _Vehicle extends Vehicle {
  const factory _Vehicle(
      {required final String id,
      required final String name,
      required final String brand,
      required final String model,
      required final int year,
      required final String type,
      required final String transmission,
      required final String fuelType,
      required final int seats,
      required final String imageUrl,
      required final double pricePerDay,
      required final double rating,
      required final int reviewCount,
      required final List<String> features,
      required final bool isAvailable,
      required final double depositAmount,
      required final List<String> requiredDocuments,
      required final List<String> rentalRequirements,
      required final Map<int, double> priceDiscounts,
      required final List<String> paymentMethods,
      required final Map<String, String> rentalTerms}) = _$VehicleImpl;
  const _Vehicle._() : super._();

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get brand;
  @override
  String get model;
  @override
  int get year;
  @override
  String get type;
  @override
  String get transmission;
  @override
  String get fuelType;
  @override
  int get seats;
  @override
  String get imageUrl;
  @override
  double get pricePerDay;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  List<String> get features;
  @override
  bool get isAvailable; // Thêm thông tin yêu cầu thuê xe
  @override
  double get depositAmount; // Số tiền cọc
  @override
  List<String> get requiredDocuments; // Danh sách giấy tờ cần thiết
  @override
  List<String> get rentalRequirements; // Yêu cầu khi thuê
  @override
  Map<int, double> get priceDiscounts; // Giảm giá theo số ngày thuê
  @override
  List<String> get paymentMethods;
  @override
  Map<String, String> get rentalTerms;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
