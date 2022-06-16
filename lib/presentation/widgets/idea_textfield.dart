import 'package:flutter/material.dart';

class IdeaTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final bool autofocus;
  final bool isDense;
  final bool expands;
  final int? maxLines;
  final int? minLines;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;

  const IdeaTextField({
    required this.labelText,
    required this.controller,
    this.autofocus = false,
    this.isDense = true,
    this.expands = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintText,
    this.focusNode,
    this.contentPadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      autofocus: autofocus,
      expands: expands,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: labelText,
        hintText: hintText,
        isDense: isDense,
        contentPadding: contentPadding,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
