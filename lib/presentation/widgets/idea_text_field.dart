import 'package:flutter/material.dart';

import '../../colors.dart';

class IdeaTextField extends StatelessWidget {
  final String? hintText;
  final bool autofocus;
  final bool isDense;
  final bool expands;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final EdgeInsets margin;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color? fillColor;
  final bool? filled;
  final Color? cursorColor;
  final TextStyle? style;
  final Function(String val)? onChanged;
  final Function(String val)? onSubmitted;
  final Function()? onEditingComplete;

  final TextCapitalization textCapitalization;

  const IdeaTextField({
    this.controller,
    this.autofocus = false,
    this.isDense = true,
    this.expands = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintText,
    this.focusNode,
    this.contentPadding,
    this.margin = EdgeInsets.zero,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.focusedBorderColor = AppColors.primaryForegroundColor,
    this.enabledBorderColor = AppColors.grey,
    this.fillColor,
    this.filled,
    this.cursorColor,
    this.style,
    this.textCapitalization = TextCapitalization.sentences,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: TextField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          autofocus: autofocus,
          expands: expands,
          focusNode: focusNode,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          textAlignVertical: TextAlignVertical.top,
          textCapitalization: textCapitalization,
          style: style,
          cursorColor: cursorColor,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            hintText: hintText,
            isDense: isDense,
            suffixIcon: suffixIcon,
            fillColor: fillColor,
            filled: filled,
            contentPadding: contentPadding,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
          ),
        ),
      );
}
