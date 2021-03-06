import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/domain/entities/register_firebase.dart';
import 'package:sapad_v3/infrastructure/presentation/components/popup_therapy.dart';
import 'package:url_launcher/url_launcher.dart';

class MeditationPage extends StatefulWidget {
  final bool? medo;
  final bool? ansi;
  final bool? triste;
  final bool? stress;
  final bool? raiva;

  MeditationPage(
      {Key? key, this.medo, this.ansi, this.triste, this.stress, this.raiva})
      : super(key: key);

  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final user = FirebaseAuth.instance.currentUser!;
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  late String _url;
  AudioPlayer? _player;
  late AudioCache cache;
  late final bool? medo;
  late final bool? ansi;
  late final bool? triste;
  late final bool? stress;
  late final bool? raiva;

  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
  }

  readFirebase() async {
    var songs = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Songs')
        .get();
    _url = songs.data()?['video'];
    var emotes = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Emotion')
        .get();
    medo = emotes.data()?['medo'];
    ansi = emotes.data()?['ansi'];
    stress = emotes.data()?['stress'];
    triste = emotes.data()?['triste'];
    raiva = emotes.data()?['raiva'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Medita????o Guiada",
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black87,
        body: ListView(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
            children: [
              //Card 1
              PopUpTherapy(
                  onPressed: () => _requestPop(context),
                  name: "Saiba mais sobre a Medita????o",
                  images: MdiIcons.emoticonExcited),
              SizedBox(height: 20),

              //Card 2
              GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "Medita????o Guiada",
                                  style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 25)),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        SizedBox(width: 40),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.purple[300],
                              borderRadius: BorderRadius.circular(100.0)),
                          child: IconButton(
                            iconSize: 50.0,
                            color: Colors.purple,
                            onPressed: () {
                              if (!playing) {
                                cache.play("Med1.mp3");
                                setState(() {
                                  playBtn = Icons.pause;
                                  playing = true;
                                });
                              } else {
                                _player!.pause();
                                setState(() {
                                  playBtn = Icons.play_arrow;
                                  playing = false;
                                });
                              }
                            },
                            icon: Icon(playBtn),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  _requestPop(context);
                },
              ),

              SizedBox(height: 20),

              //Card 3
              Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            "Medita????o Personalizada",
                            style: GoogleFonts.lora(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(100.0)),
                        child: IconButton(
                          iconSize: 50.0,
                          color: Colors.purple,
                          onPressed: () {
                            abrirLink();
                          },
                          icon: Icon(Icons.play_arrow),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]));
  }

  _requestPop(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.purple[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            content: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: Text(
                  "Uma pr??tica que engloba relaxamento corporal, diminui????o da respira????o, levando a um estado de paz, calma e tranquilidade, tanto f??sica como mentalmente. ?? das condi????es b??sicas para se meditar ?? concentra????o e a aten????o em algum foco, seja interno como a observa????o nos m??sculos da respira????o, seja externo na concentra????o em algum som ou cheiro.\n\nEssa pr??tica pode ser induzida por um facilitador, onde ele guia com as palavras o tipo de foco que o praticante ter??, quais os m??sculos que ele deve relaxar assim por diante, ou todo o processo pode ser feito de forma aut??noma pelo pr??prio praticante.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK", style: TextStyle(color: Colors.red)))
            ],
          );
        });
  }

  Future<void> abrirLink() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      print('Could not launch $_url');
    }
  }
}
