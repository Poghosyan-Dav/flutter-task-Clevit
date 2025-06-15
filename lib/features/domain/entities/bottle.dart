import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottle.freezed.dart';

@freezed
class Bottle with _$Bottle {
  const factory Bottle({
    required String id,
    required String title,
    required String imageUrl,
    required String price,
    required String distillery,
    required String country,
    required String type,
    required String bottler,
    required String cask,
    required String abv,
    required String age,
  }) = _Bottle;
}
