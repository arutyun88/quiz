import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppTextFieldV2 extends StatefulWidget {
  const AppTextFieldV2({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onSubmitted,
    this.inputFormatters,
    this.autofillHints,
  });

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  @override
  State<AppTextFieldV2> createState() => _AppTextFieldV2State();
}

class _AppTextFieldV2State extends State<AppTextFieldV2> {
  bool _obscured = true;

  bool get _autocorrect {
    if (widget.obscureText) return false;
    final t = widget.keyboardType;
    return t != TextInputType.emailAddress &&
        t != TextInputType.url &&
        t != TextInputType.phone &&
        t != TextInputType.number;
  }

  TextCapitalization get _textCapitalization {
    if (widget.obscureText) return TextCapitalization.none;
    final t = widget.keyboardType;
    if (t == TextInputType.emailAddress ||
        t == TextInputType.url ||
        t == TextInputType.phone ||
        t == TextInputType.number) return TextCapitalization.none;
    if (t == TextInputType.name) return TextCapitalization.words;
    return TextCapitalization.sentences;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final isPassword = widget.obscureText;
    final obscureActive = isPassword && _obscured;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: colors.text.primary, width: 1.5)),
          ),
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            widget.label,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              letterSpacing: 2,
              color: colors.text.secondary,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: colors.divider, width: 1)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  onChanged: widget.onChanged,
                  onTap: widget.onTap,
                  onSubmitted: widget.onSubmitted,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  autofillHints: widget.autofillHints,
                  obscureText: obscureActive,
                  enabled: widget.enabled,
                  readOnly: widget.readOnly,
                  autocorrect: _autocorrect,
                  textCapitalization: _textCapitalization,
                  inputFormatters: widget.inputFormatters,
                  style: GoogleFonts.spectral(
                    fontSize: 18,
                    color: widget.enabled ? colors.text.primary : colors.text.secondary,
                  ),
                  cursorColor: colors.text.primary,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    hintText: widget.hint,
                    hintStyle: GoogleFonts.spectral(
                      fontSize: 18,
                      color: colors.text.secondary.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              if (isPassword)
                GestureDetector(
                  onTap: () => setState(() => _obscured = !_obscured),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      _obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      size: 18,
                      color: colors.text.secondary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
