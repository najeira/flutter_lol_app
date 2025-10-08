import '../utils/json.dart';
import 'summoner_spell.dart';

class SummonerSpells {
  const SummonerSpells({
    required this.summonerSpellOne,
    required this.summonerSpellTwo,
  });

  final SummonerSpell summonerSpellOne;
  final SummonerSpell summonerSpellTwo;

  factory SummonerSpells.fromJson(Map<String, dynamic> json) => SummonerSpells(
    summonerSpellOne: SummonerSpell.fromJson(asMap(json['summonerSpellOne'])),
    summonerSpellTwo: SummonerSpell.fromJson(asMap(json['summonerSpellTwo'])),
  );

  Map<String, dynamic> toJson() => {
    'summonerSpellOne': summonerSpellOne.toJson(),
    'summonerSpellTwo': summonerSpellTwo.toJson(),
  };
}
