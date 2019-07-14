import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable(nullable: true)
class PokeHub {
  List<Pokemon> pokemon;

  PokeHub({this.pokemon});

  factory PokeHub.fromJson(Map<String, dynamic> json) =>
      _$PokeHubFromJson(json);

  Map<String, dynamic> toJson() => _$PokeHubToJson(this);
}

@JsonSerializable(nullable: true)
class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  String spawnChance;
  String avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<NextEvolution> next_evolution;

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.next_evolution});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable(nullable: true)
class NextEvolution {
  String num;
  String name;

  NextEvolution({this.num, this.name});

  factory NextEvolution.fromJson(Map<String, dynamic> json) =>
      _$NextEvolutionFromJson(json);

  Map<String, dynamic> toJson() => _$NextEvolutionToJson(this);
}
