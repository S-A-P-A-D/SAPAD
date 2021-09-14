import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

defaultPopUp(context, String content, Color color, VoidCallback onPressed) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: GoogleFonts.lora(
                    textStyle: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: onPressed,
                child: Text("OK", style: TextStyle(color: Colors.red)))
          ],
        );
      });
}
