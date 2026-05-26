import 'package:decks_app/core/colors.dart';
import 'package:decks_app/pages/deck_form_page.dart';

import 'package:flutter/material.dart';

class EmptyDecksWidget extends StatefulWidget {
  const EmptyDecksWidget({super.key});

  @override
  State<EmptyDecksWidget> createState() => _EmptyDecksWidgetState();
}

class _EmptyDecksWidgetState extends State<EmptyDecksWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: Image.asset(
              key: Key("image"),
              "images/no_decks.png",
              scale: 7,
            ),
          ),
          SizedBox(
            height: 60,
            child: TextButton(
              key: Key("btnOutlineAdicionar"),
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DesckForm()),
                );
              },
              child: Center(
                child: Text(
                  "Adicionar deck",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
