import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
  late int _contMedit = 0;
  late int contMedit = 0;
  late int contMeditmed = 0;
  late int contMeditansi = 0;
  late int contMeditraiva = 0;
  late int contMeditstress = 0;
  late int contMedittriste = 0;
  late int _contCromo = 0;
  late int contCromo = 0;
  late int contCromomed = 0;
  late int contCromoansi = 0;
  late int contCromoraiva = 0;
  late int contCromostress = 0;
  late int contCromotriste = 0;
  late int _contMusic = 0;
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
  static final List<String> items = <String>[
    'Meditação',
    'Cromoterapia',
    'Musicoterapia'
  ];
  late String value = items.first;

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
                                          color: Colors.white, fontSize: 30),
                                      decoration: InputDecoration(
                                        labelText:
                                            "Insira o E-mail de seu paciente:",
                                        labelStyle: GoogleFonts.lora(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
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

            //Dropdown Button
            SizedBox(height: 10),
            Visibility(
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
                            color: Colors.red,
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: DropdownButton<String>(
                                        focusColor: Colors.black,
                                        dropdownColor: Colors.red,
                                        value: value,
                                        items: items
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  child: Text(
                                                    item,
                                                    style: GoogleFonts.lora(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 30,
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  value: item,
                                                ))
                                            .toList(),
                                        onChanged: (value) => setState(() {
                                          this.value = value!;
                                        }),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
              visible: emailParceiro.isNotEmpty ? true : false,
            ),

            //Card Meditação
            SizedBox(height: 10),
            Visibility(
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
                                    Text("Meditação:",
                                        style: GoogleFonts.lora(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))),
                                    SizedBox(width: 10),
                                    Text(medit.toString(),
                                        style: GoogleFonts.lora(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
              visible: value.contains("Meditação") && emailParceiro.isNotEmpty
                  ? true
                  : false,
            ),

            //Card Cromoterapia
            SizedBox(height: 10),
            Visibility(
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
                                    Text("Cromoterapia:",
                                        style: GoogleFonts.lora(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))),
                                    SizedBox(width: 5),
                                    Text(cromo.toString(),
                                        style: GoogleFonts.lora(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
              visible:
                  value.contains("Cromoterapia") && emailParceiro.isNotEmpty
                      ? true
                      : false,
            ),

            //Card Musicoterapia
            SizedBox(height: 10),
            Visibility(
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
                                    Text("Musicoterapia:",
                                        style: GoogleFonts.lora(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))),
                                    SizedBox(width: 0),
                                    Text(music.toString(),
                                        style: GoogleFonts.lora(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
              visible:
                  value.contains("Musicoterapia") && emailParceiro.isNotEmpty
                      ? true
                      : false,
            ),

            //Grafico Meditação
            Visibility(
              child: SfCircularChart(
                title: ChartTitle(
                  text:
                      'Estatísticas da Meditação \n Conforme uso por emoção sentida \n\n Total de Meditações realizadas: $_contMedit',
                  textStyle: TextStyle(color: Colors.white),
                ),
                legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    textStyle: TextStyle(color: Colors.white, fontSize: 10),
                    alignment: ChartAlignment.center,
                    itemPadding: 20,
                    position: LegendPosition.right),
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
              visible: value.contains("Meditação") && emailParceiro.isNotEmpty
                  ? true
                  : false,
            ),

            //Grafico Cromoterapia
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Cromaterapia \n Conforme uso por emoção sentida \n\n\n Total de Cromaterapias realizadas: $_contCromo',
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                      textStyle: TextStyle(color: Colors.white, fontSize: 10),
                      alignment: ChartAlignment.center,
                      itemPadding: 20,
                      position: LegendPosition.right),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    DoughnutSeries<GDPDatacromo, dynamic>(
                        dataSource: _chartDatacromo,
                        xValueMapper: (GDPDatacromo data, _) => data.emoteBaseC,
                        yValueMapper: (GDPDatacromo data, _) => data.contCromo,
                        pointColorMapper: (GDPDatacromo data, _) =>
                            data.colorgraf,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true),
                  ],
                ),
              ),
              visible:
                  value.contains("Cromoterapia") && emailParceiro.isNotEmpty
                      ? true
                      : false,
            ),

            //Grafico Musicoterapia
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Musicoterapia \n Conforme uso por emoção sentida \n\n\n Total de Musicoterapia realizadas: $_contMusic',
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                      textStyle: TextStyle(color: Colors.white, fontSize: 10),
                      alignment: ChartAlignment.center,
                      itemPadding: 20,
                      position: LegendPosition.right),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    DoughnutSeries<GDPDatamusic, dynamic>(
                        dataSource: _chartDatamusic,
                        xValueMapper: (GDPDatamusic data, _) => data.emoteBaseM,
                        yValueMapper: (GDPDatamusic data, _) => data.contMusic,
                        pointColorMapper: (GDPDatamusic data, _) =>
                            data.colorgraf,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true),
                  ],
                ),
              ),
              visible:
                  value.contains("Musicoterapia") && emailParceiro.isNotEmpty
                      ? true
                      : false,
            ),

            //Botão
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    backgroundColor: Colors.red,
                    child: Icon(
                      MdiIcons.accountSearch,
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
    final List<GDPDatamedit> chartData = [];
    this.emotea.forEach((emoteBase) => {
          if (emoteBase == 'Medo')
            {
              contMedit = contMeditmed,
              chartData
                  .add(new GDPDatamedit('Medo', contMedit, Color(0xff3366cc))),
            }
          else if (emoteBase == 'Raiva')
            {
              contMedit = contMeditraiva,
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
    final List<GDPDatacromo> chartData = [];
    this.emotea.forEach((emoteBaseC) => {
          if (emoteBaseC == 'Medo')
            {
              contCromo = contCromomed,
              chartData
                  .add(new GDPDatacromo('Medo', contCromo, Color(0xff3366cc))),
            }
          else if (emoteBaseC == 'Raiva')
            {
              contCromo = contCromoraiva,
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
    final List<GDPDatamusic> chartData = [];
    this.emotea.forEach((emoteBaseM) => {
          if (emoteBaseM == 'Medo')
            {
              contMusic = contMusicmed,
              chartData
                  .add(new GDPDatamusic('Medo', contMusic, Color(0xff3366cc))),
            }
          else if (emoteBaseM == 'Raiva')
            {
              contMusic = contMusicraiva,
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
        .doc('EmotionStats')
        .get();
    List<dynamic> listMedit = (tec.data()?['Meditacao']);
    var listMedit2 = listMedit.map((e) => EmotionStats.fromJson(e)).toList();
    var listMeditOver = listMedit2.groupBy((m) => m.emotion);
    List<dynamic> listCromo = (tec.data()?['Cromoterapia']);
    var listCromo2 = listCromo.map((e) => EmotionStats.fromJson(e)).toList();
    var listCromoOver = listCromo2.groupBy((m) => m.emotion);
    List<dynamic> listMusic = (tec.data()?['Musicoterapia']);
    var listMusic2 = listMusic.map((e) => EmotionStats.fromJson(e)).toList();
    var listMusicOver = listMusic2.groupBy((m) => m.emotion);

    contMeditansi = listMeditOver['ansiedade']?.length ?? 0;
    contMeditmed = listMeditOver['medo']?.length ?? 0;
    contMeditraiva = listMeditOver['raiva']?.length ?? 0;
    contMeditstress = listMeditOver['stress']?.length ?? 0;
    contMedittriste = listMeditOver['triste']?.length ?? 0;

    contCromoansi = listCromoOver['ansiedade']?.length ?? 0;
    contCromomed = listCromoOver['medo']?.length ?? 0;
    contCromoraiva = listCromoOver['raiva']?.length ?? 0;
    contCromostress = listCromoOver['stress']?.length ?? 0;
    contCromotriste = listCromoOver['triste']?.length ?? 0;

    contMusicansi = listMusicOver['ansiedade']?.length ?? 0;
    contMusicmed = listMusicOver['medo']?.length ?? 0;
    contMusicraiva = listMusicOver['raiva']?.length ?? 0;
    contMusicstress = listMusicOver['stress']?.length ?? 0;
    contMusictriste = listMusicOver['triste']?.length ?? 0;

    var cont = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();

    cromo = cont.data()?["contCromo"];
    music = cont.data()?["contMusic"];
    medit = cont.data()?["contMedit"];

    List<String> emotea = [];

    emotea.add('Medo');

    emotea.add('Ansiedade');

    emotea.add('Raiva');

    emotea.add('Estresse');

    emotea.add('Triste');

    this.emotea = emotea;

    _chartDatamedit = getChartDatamedit();
    _chartDatacromo = getChartDatacromo();
    _chartDatamusic = getChartDatamusic();
    setState(() {});
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

class EmotionStats {
  final String emotion;
  final Timestamp date;

  EmotionStats(this.emotion, this.date);
  Map<String, dynamic> toJson() {
    return {"date": this.date, "emotion": this.emotion};
  }

  EmotionStats.fromJson(Map json)
      : emotion = json['emotion'],
        date = json['date'];
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
