import 'package:decks_app/core/colors.dart';
import 'package:decks_app/core/injections.dart';
import 'package:decks_app/models/decks_model.dart';
import 'package:decks_app/stores/deck_store.dart';

import 'package:decks_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class CardFormPage extends StatefulWidget {
  final Decks deck;
  const CardFormPage({super.key, required this.deck});

  @override
  State<CardFormPage> createState() => _CardFormPageState();
}

class _CardFormPageState extends State<CardFormPage> {
  final store = getIt.get<DeckStore>();

  final questionController = TextEditingController();
  final answersController = TextEditingController();

  @override
  void dispose() {
    questionController.dispose();
    answersController.dispose();

    super.dispose();
  }

  Widget addButton() {
    return SizedBox(
      width: 150,
      height: 50,
      child: TextButton(
        key: Key("addCardQuestion"),
        onPressed: () {
          if (questionController.text.isNotEmpty &&
              answersController.text.isNotEmpty) {
            store.addNewCard(
              question: questionController.text,
              answers: answersController.text,
              idDeck: widget.deck.id,
            );

            Navigator.of(context).pop();
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: primaryColor),
          ),
        ),
        child: Text(
          "Adicionar",
          style: TextStyle(fontSize: 15, color: secondColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        title: Text("Novo cartão"),
        centerTitle: true,
        backgroundColor: secondColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
        child: Column(
          children: [
            TextfieldWidget(
              text: "Pergunta",
              controller: questionController,
              key: Key("inputPergunta"),
            ),
            SizedBox(height: 50),
            TextfieldWidget(
              key: Key("inputResposta"),
              text: "Resposta",
              controller: answersController,
              maxLines: 3,
            ),
            SizedBox(height: 80),
            addButton(),
          ],
        ),
      ),
    );
  }
}
