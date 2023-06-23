import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Icon icon;
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return PopupMenuButton(
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            child: FilledButton.icon(
              onPressed: onPressed,
              icon: icon,
              label: Text(
                text,
                style: TextStyle(fontSize: width < 600 ? 12 : 16),
              ),
            ),
          ),
        ],
        child: icon,
      );
    }
    if (width > 600) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          text,
          style: TextStyle(fontSize: width < 600 ? 12 : 16),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
