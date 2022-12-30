import 'package:flutter/material.dart';

class IconButtonWrapper extends StatelessWidget {
  const IconButtonWrapper({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final Function() onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.network(
        icon,
        height: 30.0,
        width: 30.0,
      ),
    );
  }
}
