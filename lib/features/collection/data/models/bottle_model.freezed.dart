// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BottleModel _$BottleModelFromJson(Map<String, dynamic> json) {
  return _BottleModel.fromJson(json);
}

/// @nodoc
mixin _$BottleModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'distillery')
  String? get distillery => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'bottler')
  String? get bottler => throw _privateConstructorUsedError;
  @JsonKey(name: 'cask')
  String? get cask => throw _privateConstructorUsedError;
  @JsonKey(name: 'abv')
  String? get abv => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  String? get age => throw _privateConstructorUsedError;

  /// Serializes this BottleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BottleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottleModelCopyWith<BottleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottleModelCopyWith<$Res> {
  factory $BottleModelCopyWith(
    BottleModel value,
    $Res Function(BottleModel) then,
  ) = _$BottleModelCopyWithImpl<$Res, BottleModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'price') String? price,
    @JsonKey(name: 'distillery') String? distillery,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'bottler') String? bottler,
    @JsonKey(name: 'cask') String? cask,
    @JsonKey(name: 'abv') String? abv,
    @JsonKey(name: 'age') String? age,
  });
}

/// @nodoc
class _$BottleModelCopyWithImpl<$Res, $Val extends BottleModel>
    implements $BottleModelCopyWith<$Res> {
  _$BottleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? distillery = freezed,
    Object? country = freezed,
    Object? type = freezed,
    Object? bottler = freezed,
    Object? cask = freezed,
    Object? abv = freezed,
    Object? age = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            price:
                freezed == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as String?,
            distillery:
                freezed == distillery
                    ? _value.distillery
                    : distillery // ignore: cast_nullable_to_non_nullable
                        as String?,
            country:
                freezed == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as String?,
            type:
                freezed == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String?,
            bottler:
                freezed == bottler
                    ? _value.bottler
                    : bottler // ignore: cast_nullable_to_non_nullable
                        as String?,
            cask:
                freezed == cask
                    ? _value.cask
                    : cask // ignore: cast_nullable_to_non_nullable
                        as String?,
            abv:
                freezed == abv
                    ? _value.abv
                    : abv // ignore: cast_nullable_to_non_nullable
                        as String?,
            age:
                freezed == age
                    ? _value.age
                    : age // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BottleModelImplCopyWith<$Res>
    implements $BottleModelCopyWith<$Res> {
  factory _$$BottleModelImplCopyWith(
    _$BottleModelImpl value,
    $Res Function(_$BottleModelImpl) then,
  ) = __$$BottleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'price') String? price,
    @JsonKey(name: 'distillery') String? distillery,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'bottler') String? bottler,
    @JsonKey(name: 'cask') String? cask,
    @JsonKey(name: 'abv') String? abv,
    @JsonKey(name: 'age') String? age,
  });
}

/// @nodoc
class __$$BottleModelImplCopyWithImpl<$Res>
    extends _$BottleModelCopyWithImpl<$Res, _$BottleModelImpl>
    implements _$$BottleModelImplCopyWith<$Res> {
  __$$BottleModelImplCopyWithImpl(
    _$BottleModelImpl _value,
    $Res Function(_$BottleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BottleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? distillery = freezed,
    Object? country = freezed,
    Object? type = freezed,
    Object? bottler = freezed,
    Object? cask = freezed,
    Object? abv = freezed,
    Object? age = freezed,
  }) {
    return _then(
      _$BottleModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as String?,
        distillery:
            freezed == distillery
                ? _value.distillery
                : distillery // ignore: cast_nullable_to_non_nullable
                    as String?,
        country:
            freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as String?,
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String?,
        bottler:
            freezed == bottler
                ? _value.bottler
                : bottler // ignore: cast_nullable_to_non_nullable
                    as String?,
        cask:
            freezed == cask
                ? _value.cask
                : cask // ignore: cast_nullable_to_non_nullable
                    as String?,
        abv:
            freezed == abv
                ? _value.abv
                : abv // ignore: cast_nullable_to_non_nullable
                    as String?,
        age:
            freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BottleModelImpl implements _BottleModel {
  const _$BottleModelImpl({
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'title') this.title,
    @JsonKey(name: 'imageUrl') this.imageUrl,
    @JsonKey(name: 'price') this.price,
    @JsonKey(name: 'distillery') this.distillery,
    @JsonKey(name: 'country') this.country,
    @JsonKey(name: 'type') this.type,
    @JsonKey(name: 'bottler') this.bottler,
    @JsonKey(name: 'cask') this.cask,
    @JsonKey(name: 'abv') this.abv,
    @JsonKey(name: 'age') this.age,
  });

  factory _$BottleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BottleModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'price')
  final String? price;
  @override
  @JsonKey(name: 'distillery')
  final String? distillery;
  @override
  @JsonKey(name: 'country')
  final String? country;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'bottler')
  final String? bottler;
  @override
  @JsonKey(name: 'cask')
  final String? cask;
  @override
  @JsonKey(name: 'abv')
  final String? abv;
  @override
  @JsonKey(name: 'age')
  final String? age;

  @override
  String toString() {
    return 'BottleModel(id: $id, title: $title, imageUrl: $imageUrl, price: $price, distillery: $distillery, country: $country, type: $type, bottler: $bottler, cask: $cask, abv: $abv, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.distillery, distillery) ||
                other.distillery == distillery) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.bottler, bottler) || other.bottler == bottler) &&
            (identical(other.cask, cask) || other.cask == cask) &&
            (identical(other.abv, abv) || other.abv == abv) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    imageUrl,
    price,
    distillery,
    country,
    type,
    bottler,
    cask,
    abv,
    age,
  );

  /// Create a copy of BottleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottleModelImplCopyWith<_$BottleModelImpl> get copyWith =>
      __$$BottleModelImplCopyWithImpl<_$BottleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BottleModelImplToJson(this);
  }
}

abstract class _BottleModel implements BottleModel {
  const factory _BottleModel({
    @JsonKey(name: 'id') final String? id,
    @JsonKey(name: 'title') final String? title,
    @JsonKey(name: 'imageUrl') final String? imageUrl,
    @JsonKey(name: 'price') final String? price,
    @JsonKey(name: 'distillery') final String? distillery,
    @JsonKey(name: 'country') final String? country,
    @JsonKey(name: 'type') final String? type,
    @JsonKey(name: 'bottler') final String? bottler,
    @JsonKey(name: 'cask') final String? cask,
    @JsonKey(name: 'abv') final String? abv,
    @JsonKey(name: 'age') final String? age,
  }) = _$BottleModelImpl;

  factory _BottleModel.fromJson(Map<String, dynamic> json) =
      _$BottleModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'price')
  String? get price;
  @override
  @JsonKey(name: 'distillery')
  String? get distillery;
  @override
  @JsonKey(name: 'country')
  String? get country;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'bottler')
  String? get bottler;
  @override
  @JsonKey(name: 'cask')
  String? get cask;
  @override
  @JsonKey(name: 'abv')
  String? get abv;
  @override
  @JsonKey(name: 'age')
  String? get age;

  /// Create a copy of BottleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottleModelImplCopyWith<_$BottleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
