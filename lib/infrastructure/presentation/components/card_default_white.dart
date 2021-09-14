import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWhiteDefault extends StatelessWidget {
  final String text;
  final String image;

  const CardWhiteDefault({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(radius: 40, backgroundImage: AssetImage(image)),
            SizedBox(width: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                  textStyle: TextStyle(fontSize: 20.0, color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
