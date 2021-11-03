import 'package:flutter/material.dart';

/// custom button for Notes App
class NoteCustomButton extends StatelessWidget {
  final Widget child;
  final double heightButton;
  final double widthButton;
  final VoidCallback onTap;
  final Color color;

  NoteCustomButton({
    Key? key,
    required this.child,
    required this.heightButton,
    required this.widthButton,
    required this.onTap,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Container(
          height: heightButton,
          width: widthButton,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
