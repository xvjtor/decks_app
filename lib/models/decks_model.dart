import 'package:decks_app/models/card_model.dart';
import 'package:hive/hive.dart';


part "decks_model.g.dart";

@HiveType(typeId: 1)
class Decks {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  List<Card> cards = [];

  Decks({required this.name, required this.id, this.cards = const []});
}
