import 'package:flutter/material.dart';

//Refactor the Padding widget into a new widget named RoundedButton, making sure, the color, onPressed and text values are mutable
class RoundedButton extends StatelessWidget {
  final Color color;
  final void Function() onPressed;
  final String label;

  RoundedButton({required this.color, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(label),
        ),
      ),
    );
  }
}