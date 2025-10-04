import 'summoner_spell.dart';

class SummonerSpells {
  const SummonerSpells({required this.summonerSpellOne, required this.summonerSpellTwo});

  final SummonerSpell summonerSpellOne;
  final SummonerSpell summonerSpellTwo;

  factory SummonerSpells.fromJson(Map<String, dynamic> json) => SummonerSpells(
        summonerSpellOne:
            SummonerSpell.fromJson(json['summonerSpellOne'] as Map<String, dynamic>),
        summonerSpellTwo:
            SummonerSpell.fromJson(json['summonerSpellTwo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'summonerSpellOne': summonerSpellOne.toJson(),
        'summonerSpellTwo': summonerSpellTwo.toJson(),
      };
}
