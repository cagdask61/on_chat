import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final TextStyle? textStyle;

  const Button(
      {super.key,
      required this.text,
      required this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
