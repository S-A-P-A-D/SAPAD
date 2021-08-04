import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PopUpTherapy extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final IconData images;

  const PopUpTherapy(
      {Key? key,
      required this.onPressed,
      required this.name,
      required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          color: Colors.black54,
          shadowColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(images, size: 50, color: Colors.red),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(name,
                        style: GoogleFonts.lora(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 25))),
                  )
                ],
              ))),
      onTap: onPressed,
    );
  }
}
