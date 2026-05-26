import 'package:decks_app/core/colors.dart';
import 'package:decks_app/core/injections.dart';

import 'package:decks_app/pages/deck_form_page.dart';

import 'package:decks_app/stores/home_store.dart';
import 'package:decks_app/widgets/decks_list_widget.dart';
import 'package:decks_app/widgets/empty_decks_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = getIt.get<HomeStore>();

  @override
  void initState() {
    super.initState();

    homeStore.getDecks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Decks", style: TextStyle(color: secondColor)),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: Key("btnAdicionar"),
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DesckForm()),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
        label: Text("Adiconar", style: TextStyle(color: secondColor)),
      ),
      body: Observer(
        builder: (_) {
          if (homeStore.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }

          if (homeStore.decks.isEmpty) {
            return EmptyDecksWidget();
          }

          return DecksList();
        },
      ),
    );
  }
}
