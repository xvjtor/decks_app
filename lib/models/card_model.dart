
import 'package:hive_flutter/hive_flutter.dart';

part "card_model.g.dart";

@HiveType(typeId: 2)
class Card{
  @HiveField(0)
  String id;
 
  @HiveField(1)
  String question;

  @HiveField(2)
  String answers;

 


  @HiveField(3)
  int points = 0;


  Card({
    required this.question, required this.answers, required this.id
  });
}