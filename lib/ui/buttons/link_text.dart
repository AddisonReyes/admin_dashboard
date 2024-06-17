import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {
  const LinkText({
    super.key,
    required this.text,
    this.onPressed,
  });

  final void Function()? onPressed;
  final String text;

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              decoration:
                  isHover ? TextDecoration.underline : TextDecoration.none,
              decorationColor: Colors.grey.shade700,
              color: Colors.grey.shade700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
