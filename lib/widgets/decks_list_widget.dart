import 'package:decks_app/core/colors.dart';
import 'package:decks_app/core/injections.dart';
import 'package:decks_app/pages/deck_details_page.dart';

import 'package:decks_app/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DecksList extends StatefulWidget {
  final homeStore = getIt.get<HomeStore>();

  DecksList({super.key});

  @override
  State<DecksList> createState() => _DecksListState();
}

class _DecksListState extends State<DecksList> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (contex) {
        return ListView.builder(
          itemCount: widget.homeStore.decks.length,
          itemBuilder: (context, index) {
            final deck = widget.homeStore.decks[index];

            return InkWell(
              child: Container(
                decoration: BoxDecoration(
                  border: BoxBorder.fromLTRB(
                    bottom: BorderSide(color: primaryColor),
                  ),
                ),

                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(deck.name, style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    Text("${deck.cards.length} cartões"),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DeckDetailsPage(deck: deck),
                  ),
                );
              },
              onLongPress: () async {
                final result = await showDialog<bool>(
                  context: context,

                  builder: (_) {
                    return AlertDialog(
                      title: const Text("Excluir deck"),

                      content: const Text(
                        "Deseja realmente excluir este deck?",
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },

                          child: Text(
                            "Cancelar",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },

                          child: Text(
                            "Excluir",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ],
                    );
                  },
                );

                if (result == true) {
                  await widget.homeStore.removeDeck(deck.id);
                }
              },
            );
          },
        );
      },
    );
  }
}
