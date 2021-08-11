import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/Telas/components/popup_therapy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sapad_v3/Telas/Screens/timer_provider.dart';

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
  var timer;
  AudioPlayer? _player;
  late AudioCache cache;
  int contTimer = 0;
  var timeInit;
  var timePause;

  void initState() {
    super.initState();
    timer = Provider.of<TimerProvider>(context, listen: false);
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
  }

  readFirebase() async {
    var songs = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Songs')
        .get();
    _url = songs.data()?['video'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Meditação Guiada",
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black87,
        body: ListView(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
            children: [
              /* Consumer<TimerProvider>(
                builder: (context, timerprovider, widget) => Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(
                        '${timer.hour} : ' +
                            '${timer.minute} : ' +
                            '${timer.seconds} ',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        (timer.stopEnable)
                            ? ElevatedButton(
                                onPressed: timer.stopTimer,
                                child: Text('Parar'),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                child: Text('Parar'),
                              ),
                        (timer.continueEnable)
                            ? ElevatedButton(
                                onPressed: timer.continueTimer,
                                child: Text('Continuar'),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                child: Text('Continuar'),
                              ),
                      ],
                    ),
                  ],
                ),
              ), */
              //Card 1
              PopUpTherapy(
                  onPressed: () => _requestPop(context),
                  name: "Saiba mais sobre a Meditação",
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
                                  "Meditação Guiada",
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
                                contTimer = 1;
                                timeInit = DateTime.now();
                                print(timeInit);
                                cache.play("Med1.mp3");
                                setState(() {
                                  playBtn = Icons.pause;
                                  playing = true;
                                });
                              } else {
                                timePause = DateTime.now();
                                print(timePause);
                                Duration timeFinal =
                                    timePause.difference(timeInit);
                                print(timeFinal);
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
                            "Meditação Personalizada",
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
                  "Uma prática que engloba relaxamento corporal, diminuição da respiração, levando a um estado de paz, calma e tranquilidade, tanto física como mentalmente. É das condições básicas para se meditar é concentração e a atenção em algum foco, seja interno como a observação nos músculos da respiração, seja externo na concentração em algum som ou cheiro.\n\nEssa prática pode ser induzida por um facilitador, onde ele guia com as palavras o tipo de foco que o praticante terá, quais os músculos que ele deve relaxar assim por diante, ou todo o processo pode ser feito de forma autônoma pelo próprio praticante.",
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

  /* void timerStart() async {
    if (contTimer == 1) {
      timer.startEnable = true;
      if (timer.startEnable == true) {
        timer.startTimer;
      }
    }
  }
  void timerStop() async {
    if (contTimer == 0) {
      await timer.stopEnable;
      print('CEBOLACEBOLACEBOLA');
    }
  } */

  /* void timerContinue() {
    if (contTimer == 2) {
      (timer.continueEnable)!;
      ElevatedButton(onPressed: timer.continueEnable, child: Text(''));
    } else {
      ElevatedButton(onPressed: null, child: Text(''));
    }
  } */

  Future<void> abrirLink() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      print('Could not launch $_url');
    }
  }
}
