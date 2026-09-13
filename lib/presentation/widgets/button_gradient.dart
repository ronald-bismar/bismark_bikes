import 'package:flutter/material.dart';

SizedBox buttonGradient(
    String text, VoidCallback onPressed, List<Color> colorsGradient) {
  return SizedBox(
    width: double.infinity,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: colorsGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5),
        ),
      ),
    ),
  );
}
