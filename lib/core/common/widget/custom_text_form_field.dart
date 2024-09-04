import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo/core/common/ui_padding.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.helperText,
    this.onChanged,
    this.maxLength,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.helperMaxLines,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.enabled = true,
    this.textInputAction,
    this.textInputType,
    this.minLength = 1,
    this.minline = 1,
  }) : super(key: key);

  final TextEditingController? controller;

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final int? maxLines;
  final int? helperMaxLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int minLength;
  final int minline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        maxLength: maxLength,
        enabled: enabled,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.left,
        obscureText: obscureText ?? false,
        style: theme.textTheme.bodyMedium,
        inputFormatters: inputFormatters ?? [],
        keyboardType: textInputType,
        textInputAction: textInputAction,
        minLines: minline,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w300, color: Colors.grey),
          labelText: labelText,
          labelStyle: theme.textTheme.displayMedium,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          helperMaxLines: helperMaxLines,
          helperText: helperText,
          helperStyle: theme.textTheme.bodyMedium?.copyWith(fontSize: 10),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: UIPadding.space12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UIPadding.radius),
            borderSide: BorderSide(color: theme.disabledColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UIPadding.radius),
            borderSide: BorderSide(color: theme.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UIPadding.radius),
            borderSide: BorderSide(color: theme.colorScheme.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UIPadding.radius),
            borderSide: BorderSide(color: theme.colorScheme.error),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UIPadding.radius),
            borderSide: BorderSide(color: theme.disabledColor),
          ),
        ),
      ),
    );
  }
}
