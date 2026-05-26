import 'package:decks_app/core/colors.dart';
import 'package:decks_app/stores/deck_store.dart';
import 'package:decks_app/stores/home_store.dart';
import 'package:decks_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DesckForm extends StatefulWidget {
  const DesckForm({super.key});

  @override
  State<DesckForm> createState() => _DesckFormState();
}

class _DesckFormState extends State<DesckForm> {
  final formKey = GlobalKey<FormState>();

  final deckStore = GetIt.I.get<DeckStore>();
  final homeStore = GetIt.I.get<HomeStore>();

  final nameController = TextEditingController();

  void addDeck() async {
    if (!formKey.currentState!.validate()) return;

    await deckStore.addDeck(nameController.text);

    if (!mounted) return;

    Navigator.of(context).pop();

    await homeStore.getDecks();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Novo deck"),
        backgroundColor: secondColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Qual é o título do seu novo deck?",
                  style: TextStyle(fontSize: 50, height: 1.2),
                ),
                SizedBox(height: 80),

                TextfieldWidget(
                  key: Key("tituloDeck"),
                  text: "Título do deck",
                  controller: nameController,
                ),
                SizedBox(height: 20),
                addButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addButton() {
    return SizedBox(
      height: 50,
      width: 150,
      child: TextButton(
        key: Key("btnAdicionarDeck"),
        onPressed: () => {addDeck()},
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          "Adicionar",
          style: TextStyle(color: secondColor, fontSize: 15),
        ),
      ),
    );
  }
}
