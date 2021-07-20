import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapad_v3/games/game_amarelo.dart';
import 'package:sapad_v3/games/game_azul.dart';
import 'package:sapad_v3/games/game_roxo.dart';
import 'package:sapad_v3/games/game_verde.dart';
import 'package:sapad_v3/games/game_vermelho.dart';

requestPopAzul(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: SingleChildScrollView(
                child: Text(
                  "O estímulo à cor azul é capaz de nos deixar mais calmos e relaxados. Ela tem um efeito pacificador no sistema nervoso, auxiliando problemas de sono e dores de cabeça.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SnakeGameAzul()));
                },
                child: Text("OK", style: TextStyle(color: Colors.red))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar", style: TextStyle(color: Colors.red)))
          ],
        );
      });
}

requestPopVermelho(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: SingleChildScrollView(
                child: Text(
                  "Essa cor fala sobre as funções psicológicas algumas delas são:\nCapacidade de obter e manter a vitalidade, de entender e equilibrar as funções básicas (a fome, o medo, o conforto, o amor).",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SnakeGameVermelho()));
                },
                child: Text("OK", style: TextStyle(color: Colors.red))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar", style: TextStyle(color: Colors.red)))
          ],
        );
      });
}

requestPopAmarelo(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: SingleChildScrollView(
                child: Text(
                  "A energia de onda dessa cor está relacionada, principalmente, com a nossa capacidade de nos sentirmos alegres\nPode ser usada no combate de tristeza",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SnakeGameAmarelo()));
                },
                child: Text("OK", style: TextStyle(color: Colors.red))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar", style: TextStyle(color: Colors.red)))
          ],
        );
      });
}

requestPopRoxo(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: SingleChildScrollView(
                child: Text(
                  " Essa cor pode regenerar o sistema nervoso estressado e com fadiga prolongada. Reduz medos e angústias e traz estabilidade e equilíbrio da consciência.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SnakeGameRoxo()));
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar", style: TextStyle(color: Colors.red)))
          ],
        );
      });
}

requestPopVerde(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: SingleChildScrollView(
                child: Text(
                  "Como o verde está no meio do espectro de cores, ele contém uma natureza tanto física quanto espiritual. Por isso, ele é considerado a cor de cura universal.\nO verde também é visto como uma cor relaxante, capaz de acalmar o sistema nervoso, relaxar os músculos e ajudar contra a insônia.\nSegundo a cromoterapia, o verde pode ajudar a curar doenças que afetam a pressão arterial, como problemas cardíacos, distúrbios nervosos e dores de cabeça.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SnakeGameVerde()));
                },
                child: Text("OK", style: TextStyle(color: Colors.red))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar", style: TextStyle(color: Colors.red)))
          ],
        );
      });
}
