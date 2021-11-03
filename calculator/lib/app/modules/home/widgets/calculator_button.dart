import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Widget child;
  final double heightButton;
  final double widthButton;
  final VoidCallback onTap;
  final Color color;

  const CalculatorButton({
    required this.heightButton,
    required this.widthButton,
    required this.child,
    required this.onTap,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 8.0,
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: onTap,
        child: Container(
          height: heightButton,
          width: widthButton,
          color: Colors.transparent,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
