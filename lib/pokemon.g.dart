// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeHub _$PokeHubFromJson(Map<String, dynamic> json) {
  return PokeHub(
      pokemon: (json['pokemon'] as List)
          ?.map((e) =>
              e == null ? null : Pokemon.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PokeHubToJson(PokeHub instance) =>
    <String, dynamic>{'pokemon': instance.pokemon};

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
      id: json['id'] as int,
      num: json['num'] as String,
      name: json['name'] as String,
      img: json['img'] as String,
      type: (json['type'] as List)?.map((e) => e as String)?.toList(),
      height: json['height'] as String,
      weight: json['weight'] as String,
      candy: json['candy'] as String,
      candyCount: json['candyCount'] as int,
      egg: json['egg'] as String,
      spawnChance: json['spawnChance'] as String,
      avgSpawns: json['avgSpawns'] as String,
      spawnTime: json['spawnTime'] as String,
      multipliers: (json['multipliers'] as List)
          ?.map((e) => (e as num)?.toDouble())
          ?.toList(),
      weaknesses:
          (json['weaknesses'] as List)?.map((e) => e as String)?.toList(),
      next_evolution: (json['next_evolution'] as List)
          ?.map((e) => e == null
              ? null
              : NextEvolution.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'num': instance.num,
      'name': instance.name,
      'img': instance.img,
      'type': instance.type,
      'height': instance.height,
      'weight': instance.weight,
      'candy': instance.candy,
      'candyCount': instance.candyCount,
      'egg': instance.egg,
      'spawnChance': instance.spawnChance,
      'avgSpawns': instance.avgSpawns,
      'spawnTime': instance.spawnTime,
      'multipliers': instance.multipliers,
      'weaknesses': instance.weaknesses,
      'next_evolution': instance.next_evolution
    };

NextEvolution _$NextEvolutionFromJson(Map<String, dynamic> json) {
  return NextEvolution(
      num: json['num'] as String, name: json['name'] as String);
}

Map<String, dynamic> _$NextEvolutionToJson(NextEvolution instance) =>
    <String, dynamic>{'num': instance.num, 'name': instance.name};
