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
  final Function(String val)? onChanged;

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
          textAlignVertical: TextAlignVertical.top,
          cursorColor: AppColors.primaryForegroundColor,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            hintText: hintText,
            isDense: isDense,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryForegroundColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
          ),
        ),
      );
}
