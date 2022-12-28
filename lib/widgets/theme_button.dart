import 'package:flutter/material.dart';
import 'package:list/generated/l10n.dart';
import 'package:list/resources/fonts.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(
        S.of(context).change,
        style: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontWeight: AppFonts.regular,
          fontSize: 10.0,
        ),
      ),
    );
  }
}
