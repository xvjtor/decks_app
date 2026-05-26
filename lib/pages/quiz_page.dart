import 'package:decks_app/core/colors.dart';
import 'package:decks_app/core/injections.dart';
import 'package:decks_app/models/card_model.dart';
import 'package:decks_app/models/decks_model.dart';
import 'package:decks_app/stores/quiz_store.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_mobx/flutter_mobx.dart';

class QuizPage extends StatefulWidget {
  final Decks deck;
  final List<Card> cards;
  const QuizPage({super.key, required this.cards, required this.deck});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final quizStore = getIt.get<QuizStore>();

  @override
  void initState() {
    super.initState();

    quizStore.totalCards = widget.cards.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Quiz: ${widget.deck.name}",
          style: TextStyle(color: secondColor),
        ),
        backgroundColor: primaryColor,
      ),

      body: Observer(
        builder: (context) {
          return quizStore.finishedQuiz
              ? Align(
                  alignment: AlignmentGeometry.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "O quiz acabou.\nVocê fez ${quizStore.score} pontos(s)",
                        style: TextStyle(fontSize: 40, height: 1.25),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      TextButton(
                        key: Key("btnVoltar"),
                        onPressed: () {
                          quizStore.currentIndex = 0;
                          quizStore.score = 0;
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Voltar",
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentGeometry.topRight,
                        child: Text(
                          "${quizStore.currentIndex.clamp(0, widget.cards.length - 1) + 1}/${widget.cards.length}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      SizedBox(height: 150),
                      Text(
                        quizStore.showAnswer
                            ? widget.cards[quizStore.currentIndex].answers
                            : widget.cards[quizStore.currentIndex].question,
                        style: TextStyle(fontSize: 40, height: 1.25),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () => quizStore.toggleCard(),

                        splashColor: Colors.black.withValues(alpha: 0.08),
                        highlightColor: Colors.transparent,

                        child: Padding(
                          padding: const EdgeInsets.all(8),

                          child: Text(
                            quizStore.showAnswer
                                ? "Visualizar pergunta"
                                : "Visualizar resposta",

                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                      correctButton(),
                      SizedBox(height: 20),
                      wrongButton(),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Widget correctButton() {
    return SizedBox(
      height: 50,
      width: 210,
      child: TextButton(
        key: Key("btnAcertei"),
        onPressed: () {
          quizStore.correctAnswer();
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          "Acertei :)",
          style: TextStyle(color: secondColor, fontSize: 18),
        ),
      ),
    );
  }

  Widget wrongButton() {
    return SizedBox(
      height: 50,
      width: 210,
      child: TextButton(
        key: Key("btnErrei"),
        onPressed: () {
          quizStore.wrongAnswer();
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          "Errei :(",
          style: TextStyle(color: secondColor, fontSize: 18),
        ),
      ),
    );
  }
}
