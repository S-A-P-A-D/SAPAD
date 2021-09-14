import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarDefault({Key? key, required this.title, leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      title: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
