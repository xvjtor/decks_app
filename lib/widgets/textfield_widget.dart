import 'package:decks_app/core/colors.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final int? maxLines;
  const TextfieldWidget({
    super.key,
    required this.text,
    this.controller,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextFormField(
        key: key,
        maxLines: maxLines ?? 1,

        controller: controller,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          label: Text(text, style: TextStyle(color: primaryColor)),

          filled: true,
          fillColor: secondColor,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Campo obrigatório";
          }
          return null;
        },
      ),
    );
  }
}
