import 'package:flutter/material.dart';

class IdeaTextField extends StatelessWidget {
  final String? hintText;
  final bool autofocus;
  final bool isDense;
  final bool expands;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const IdeaTextField({
    required this.controller,
    this.autofocus = false,
    this.isDense = true,
    this.expands = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintText,
    this.focusNode,
    this.contentPadding,
    this.suffixIcon,
    this.onTap,
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
      readOnly: readOnly,
      onTap: onTap,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: hintText,
        isDense: isDense,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            //TODO Change textfield colors
            color: Colors.green,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.5),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
