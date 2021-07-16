import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sapad_v3/FireBase/register_firebase.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AcompPage extends StatefulWidget {
  @override
  _AcompPageState createState() => _AcompPageState();
}

class _AcompPageState extends State<AcompPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  late List<GDPDatamedit> _chartDatamedit = [];
  late List<GDPDatacromo> _chartDatacromo = [];
  late List<GDPDatamusic> _chartDatamusic = [];
  late TooltipBehavior _tooltipBehavior;
  late int contMedit = 0;
  late int contMeditmed = 0;
  late int contMeditansi = 0;
  late int contMeditraiva = 0;
  late int contMeditstress = 0;
  late int contMedittriste = 0;
  late int contCromo = 0;
  late int contCromomed = 0;
  late int contCromoansi = 0;
  late int contCromoraiva = 0;
  late int contCromostress = 0;
  late int contCromotriste = 0;
  late int contMusic = 0;
  late int contMusicmed = 0;
  late int contMusicansi = 0;
  late int contMusicraiva = 0;
  late int contMusicstress = 0;
  late int contMusictriste = 0;
  late List<String> emotea = [];
  late String emoteBase;
  late String emoteBaseC;
  late String emoteBaseM;

  late String emailParceiro = "";
  late String emailCheck;
  late int medit = 1;
  late int music = 1;
  late int cromo = 1;

  void initState() {
    readFirebase();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Acompanhamento",
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(children: [
            //Card 1
            Padding(
              padding: EdgeInsets.all(0),
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Card(
                            color: Colors.black38,
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextField(
                                      autofocus: false,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 30),
                                      decoration: InputDecoration(
                                        labelText:
                                            "Insira o E-mail de seu parceiro:",
                                        labelStyle: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      controller: myController,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Visibility(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              color: Colors.black38,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Meditação:"),
                                      Text(medit.toString()),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              visible: emailParceiro.isEmpty ? false : true,
            ),
            Visibility(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              color: Colors.black38,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Cromoterapia:"),
                                      Text(cromo.toString()),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              visible: emailParceiro.isEmpty ? false : true,
            ),
            Visibility(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              color: Colors.black38,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Musicoterapia:"),
                                      Text(music.toString()),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              visible: emailParceiro.isEmpty ? false : true,
            ),

            Visibility(
              child: SfCircularChart(
                title: ChartTitle(
                  text:
                      'Estatísticas da Meditação \n Conforme uso por emoção sentida \n\n\n Total de Meditações realizadas: $contMedit',
                  textStyle: TextStyle(color: Colors.white),
                ),
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  textStyle: TextStyle(color: Colors.white),
                  alignment: ChartAlignment.center,
                  itemPadding: 20,
                ),
                tooltipBehavior: _tooltipBehavior,
                series: <CircularSeries>[
                  DoughnutSeries<GDPDatamedit, dynamic>(
                      dataSource: _chartDatamedit,
                      xValueMapper: (GDPDatamedit data, _) => data.emoteBase,
                      yValueMapper: (GDPDatamedit data, _) => data.contMedit,
                      pointColorMapper: (GDPDatamedit data, _) =>
                          data.colorgraf,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true),
                ],
              ),
              visible: emailParceiro.isEmpty ? false : true,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0, right: 40),
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.play_circle,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    onPressed: () {
                      setState(() {
                        //if (emailParceiro.isEmpty)
                        emailParceiro = myController.text;
                        updateFirebase("Songs", "emailAcomp", emailParceiro);
                        readFirebase();
                      });
                    },
                  ),
                )
              ],
            )
          ]),
        ));
  }

  List<GDPDatamedit> getChartDatamedit() {
    print('TESTETESTETESTETESTETESTETESTETESTETESTETESTE');
    final List<GDPDatamedit> chartData = [];
    this.emotea.forEach((emoteBase) => {
          print(emoteBase),
          if (emoteBase == 'Medo')
            {
              contMedit = contMeditmed,
              chartData
                  .add(new GDPDatamedit('Medo', contMedit, Color(0xff3366cc))),
            }
          else if (emoteBase == 'Raiva')
            {
              contMedit = contMeditraiva,
              print(contMedit),
              chartData
                  .add(new GDPDatamedit('Raiva', contMedit, Color(0xFFF06292))),
            }
          else if (emoteBase == 'Ansiedade')
            {
              contMedit = contMeditansi,
              chartData.add(
                  new GDPDatamedit('Ansiedade', contMedit, Color(0xFF512DA8))),
            }
          else if (emoteBase == 'Triste')
            {
              contMedit = contMedittriste,
              chartData.add(
                  new GDPDatamedit('Triste', contMedit, Color(0xffEF9A9A))),
            }
          else if (emoteBase == 'Estresse')
            {
              contMedit = contMeditstress,
              chartData.add(
                  new GDPDatamedit('Estresse', contMedit, Color(0xffff9900))),
            }
        });
    return chartData;
  }

  List<GDPDatacromo> getChartDatacromo() {
    print('TESTETESTETESTETESTETESTETESTETESTETESTETESTE');
    final List<GDPDatacromo> chartData = [];
    this.emotea.forEach((emoteBaseC) => {
          print(emoteBaseC),
          if (emoteBaseC == 'Medo')
            {
              contCromo = contCromomed,
              chartData
                  .add(new GDPDatacromo('Medo', contCromo, Color(0xff3366cc))),
            }
          else if (emoteBaseC == 'Raiva')
            {
              contCromo = contCromoraiva,
              print(contMedit),
              chartData
                  .add(new GDPDatacromo('Raiva', contCromo, Color(0xFFF06292))),
            }
          else if (emoteBaseC == 'Ansiedade')
            {
              contCromo = contCromoansi,
              chartData.add(
                  new GDPDatacromo('Ansiedade', contCromo, Color(0xFF512DA8))),
            }
          else if (emoteBaseC == 'Triste')
            {
              contCromo = contCromotriste,
              chartData.add(
                  new GDPDatacromo('Triste', contCromo, Color(0xffEF9A9A))),
            }
          else if (emoteBaseC == 'Estresse')
            {
              contCromo = contCromostress,
              chartData.add(
                  new GDPDatacromo('Estresse', contCromo, Color(0xffff9900))),
            }
        });
    return chartData;
  }

  List<GDPDatamusic> getChartDatamusic() {
    print('TESTETESTETESTETESTETESTETESTETESTETESTETESTE');
    final List<GDPDatamusic> chartData = [];
    this.emotea.forEach((emoteBaseM) => {
          print(emoteBaseM),
          if (emoteBaseM == 'Medo')
            {
              contMusic = contMusicmed,
              chartData
                  .add(new GDPDatamusic('Medo', contMusic, Color(0xff3366cc))),
            }
          else if (emoteBaseM == 'Raiva')
            {
              contMusic = contMusicraiva,
              print(contMusic),
              chartData
                  .add(new GDPDatamusic('Raiva', contMusic, Color(0xFFF06292))),
            }
          else if (emoteBaseM == 'Ansiedade')
            {
              contMusic = contMusicansi,
              chartData.add(
                  new GDPDatamusic('Ansiedade', contMusic, Color(0xFF512DA8))),
            }
          else if (emoteBaseM == 'Triste')
            {
              contMusic = contMusictriste,
              chartData.add(
                  new GDPDatamusic('Triste', contMusic, Color(0xffEF9A9A))),
            }
          else if (emoteBaseM == 'Estresse')
            {
              contMusic = contMusicstress,
              chartData.add(
                  new GDPDatamusic('Estresse', contMusic, Color(0xffff9900))),
            }
        });
    return chartData;
  }

//
  readFirebase() async {
    var tec = await FirebaseFirestore.instance
        .collection(emailParceiro)
        .doc('Stats')
        .get();
    cromo = tec.data()?['contCromo'];
    medit = tec.data()?['contMedit'];
    music = tec.data()?['contMusic'];
    contCromo = tec.data()?['contCromo'];
    contMedit = tec.data()?['contMedit'];
    contMusic = tec.data()?['contMusic'];
    contMeditansi = tec.data()?['contMeditansi'];
    contMeditmed = tec.data()?['contMeditmed'];
    contMeditraiva = tec.data()?['contMeditraiva'];
    contMeditstress = tec.data()?['contMeditstress'];
    contMedittriste = tec.data()?['contMedittriste'];
    contCromoansi = tec.data()?['contCromoansi'];
    contCromomed = tec.data()?['contCromomed'];
    contCromoraiva = tec.data()?['contCromoraiva'];
    contCromostress = tec.data()?['contCromostress'];
    contCromotriste = tec.data()?['contCromotriste'];
    contMusicansi = tec.data()?['contMusicansi'];
    contMusicmed = tec.data()?['contMusicmed'];
    contMusicraiva = tec.data()?['contMusicraiva'];
    contMusicstress = tec.data()?['contMusicstress'];
    contMusictriste = tec.data()?['contMusictriste'];
    var emote = await FirebaseFirestore.instance
        .collection(emailParceiro)
        .doc('Emotion')
        .get();
    print(emote.data());
    List<String> emotea = [];

    emotea.add('Medo');

    emotea.add('Ansiedade');

    emotea.add('Raiva');

    emotea.add('Estresse');

    emotea.add('Triste');

    this.emotea = emotea;
    print(' flgmdflkgmdopmkpdfg $emotea');
    _chartDatamedit = getChartDatamedit();
    _chartDatacromo = getChartDatacromo();
    _chartDatamusic = getChartDatamusic();
    setState(() {});
    print(
        "testetestetestetestetestetestetestetestetesteteste, $_chartDatamedit");
  }
}

class GDPDatamedit {
  final String emoteBase;
  final int contMedit;
  final Color colorgraf;
  GDPDatamedit(this.emoteBase, this.contMedit, this.colorgraf);

  @override
  String toString() {
    return emoteBase + contMedit.toString();
  }
}

class GDPDatacromo {
  final String emoteBaseC;
  final int contCromo;
  final Color colorgraf;

  GDPDatacromo(this.emoteBaseC, this.contCromo, this.colorgraf);
  @override
  String toString() {
    return emoteBaseC + contCromo.toString();
  }
}

class GDPDatamusic {
  final String emoteBaseM;
  final int contMusic;
  final Color colorgraf;

  GDPDatamusic(this.emoteBaseM, this.contMusic, this.colorgraf);
  @override
  String toString() {
    return emoteBaseM + contMusic.toString();
  }
}
