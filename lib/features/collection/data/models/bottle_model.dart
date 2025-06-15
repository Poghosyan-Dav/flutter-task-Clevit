import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottle_model.freezed.dart';
part 'bottle_model.g.dart';

@freezed
class BottleModel with _$BottleModel {
  const factory BottleModel({
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
  }) = _BottleModel;

  factory BottleModel.fromJson(Map<String, dynamic> json) =>
      _$BottleModelFromJson(json);
}