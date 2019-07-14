import 'package:json_annotation/json_annotation.dart';

part 'beer_model.g.dart';

@JsonSerializable(nullable: true)
class BeerModel {
  final String name;
  final String description;
  @JsonKey(name: "image_url")
  final String imageUrl;

  BeerModel(this.name, this.description, this.imageUrl);

  factory BeerModel.fromJson(Map<String, dynamic> json) =>
      _$BeerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BeerModelToJson(this);
}
