//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: unused_import
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatsPage extends StatefulWidget {
  final Widget? child;

  StatsPage({Key? key, this.child}) : super(key: key);

  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
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

  late int quinzeMeditansi = 0;
  late int quinzeMeditmed = 0;
  late int quinzeMeditraiva = 0;
  late int quinzeMeditstress = 0;
  late int quinzeMedittriste = 0;

  late int quinzeMusicansi = 0;
  late int quinzeMusicmed = 0;
  late int quinzeMusicraiva = 0;
  late int quinzeMusicstress = 0;
  late int quinzeMusictriste = 0;

  late int quinzeCromoansi = 0;
  late int quinzeCromomed = 0;
  late int quinzeCromoraiva = 0;
  late int quinzeCromostress = 0;
  late int quinzeCromotriste = 0;

  late int mesMeditansi = 0;
  late int mesMeditmed = 0;
  late int mesMeditraiva = 0;
  late int mesMeditstress = 0;
  late int mesMedittriste = 0;

  late int mesMusicansi = 0;
  late int mesMusicmed = 0;
  late int mesMusicraiva = 0;
  late int mesMusicstress = 0;
  late int mesMusictriste = 0;

  late int mesCromoansi = 0;
  late int mesCromomed = 0;
  late int mesCromoraiva = 0;
  late int mesCromostress = 0;
  late int mesCromotriste = 0;

  late List<String> emotea = [];
  late String emoteBase;
  late String emoteBaseC;
  late String emoteBaseM;

  @override
  void initState() {
    readFirebase();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  static final List<String> items = <String>['15 dias', '3 meses', 'Geral'];
  late String value = items.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Estatísticas', style: TextStyle(fontSize: 20)),
          centerTitle: true,
        ),
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.red,
                  tabs: [
                    Tab(
                      icon:
                          Icon(MdiIcons.headHeart, size: 50, color: Colors.red),
                    ),
                    Tab(
                      icon: Icon(MdiIcons.palette, size: 50, color: Colors.red),
                    ),
                    Tab(
                      icon:
                          Icon(MdiIcons.musicBox, size: 50, color: Colors.red),
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      //Medit Grafico
                      ListView(padding: EdgeInsets.all(5), children: [
                        Card(
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
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.red,
                                                ),
                                                child: DropdownButton<String>(
                                                  focusColor: Colors.black,
                                                  dropdownColor: Colors.red,
                                                  value: value,
                                                  items: items
                                                      .map(
                                                          (item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                child: Text(
                                                                  item,
                                                                  style: GoogleFonts.lora(
                                                                      textStyle: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              30,
                                                                          color:
                                                                              Colors.white)),
                                                                ),
                                                                value: item,
                                                              ))
                                                      .toList(),
                                                  onChanged: (value) =>
                                                      setState(() {
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

                        //Medit Grafico
                        Visibility(
                          child: Container(
                            child: SfCircularChart(
                              title: ChartTitle(
                                text:
                                    'Estatísticas da Meditação \n Conforme uso por emoção sentida \n\n\n Total de Meditações realizadas: $contMedit',
                                textStyle: TextStyle(color: Colors.white),
                              ),
                              legend: Legend(
                                  title: LegendTitle(
                                    text: 'Emoções',
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                  alignment: ChartAlignment.center,
                                  itemPadding: 20,
                                  position: LegendPosition.right),
                              tooltipBehavior: _tooltipBehavior,
                              series: <CircularSeries>[
                                DoughnutSeries<GDPDatamedit, dynamic>(
                                    dataSource: _chartDatamedit,
                                    xValueMapper: (GDPDatamedit data, _) =>
                                        data.emoteBase,
                                    yValueMapper: (GDPDatamedit data, _) =>
                                        data.contMedit,
                                    pointColorMapper: (GDPDatamedit data, _) =>
                                        data.colorgraf,
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true),
                                    enableTooltip: true),
                              ],
                            ),
                          ),
                          visible: value.contains("Geral") ? true : false,
                        ),
                      ]),

                      //Cromo Grafico
                      ListView(
                        padding: EdgeInsets.all(5),
                        children: [
                          Card(
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
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.red,
                                                  ),
                                                  child: DropdownButton<String>(
                                                    focusColor: Colors.black,
                                                    dropdownColor: Colors.red,
                                                    value: value,
                                                    items: items
                                                        .map((item) =>
                                                            DropdownMenuItem<
                                                                String>(
                                                              child: Text(
                                                                item,
                                                                style: GoogleFonts.lora(
                                                                    textStyle: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            30,
                                                                        color: Colors
                                                                            .white)),
                                                              ),
                                                              value: item,
                                                            ))
                                                        .toList(),
                                                    onChanged: (value) =>
                                                        setState(() {
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
                          Visibility(
                            child: Container(
                              child: SfCircularChart(
                                title: ChartTitle(
                                  text:
                                      'Estatísticas da Cromaterapia \n Conforme uso por emoção sentida \n\n\n Total de Cromaterapias realizadas: $contCromo',
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                                legend: Legend(
                                    isVisible: true,
                                    overflowMode: LegendItemOverflowMode.wrap,
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                    alignment: ChartAlignment.center,
                                    itemPadding: 20,
                                    position: LegendPosition.right),
                                tooltipBehavior: _tooltipBehavior,
                                series: <CircularSeries>[
                                  DoughnutSeries<GDPDatacromo, dynamic>(
                                      dataSource: _chartDatacromo,
                                      xValueMapper: (GDPDatacromo data, _) =>
                                          data.emoteBaseC,
                                      yValueMapper: (GDPDatacromo data, _) =>
                                          data.contCromo,
                                      pointColorMapper:
                                          (GDPDatacromo data, _) =>
                                              data.colorgraf,
                                      dataLabelSettings:
                                          DataLabelSettings(isVisible: true),
                                      enableTooltip: true),
                                ],
                              ),
                            ),
                            visible: value.contains("Geral") ? true : false,
                          ),
                        ],
                      ),

                      //Music Grafico
                      ListView(
                        padding: EdgeInsets.all(5),
                        children: [
                          Card(
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
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.red,
                                                  ),
                                                  child: DropdownButton<String>(
                                                    focusColor: Colors.black,
                                                    dropdownColor: Colors.red,
                                                    value: value,
                                                    items: items
                                                        .map((item) =>
                                                            DropdownMenuItem<
                                                                String>(
                                                              child: Text(
                                                                item,
                                                                style: GoogleFonts.lora(
                                                                    textStyle: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            30,
                                                                        color: Colors
                                                                            .white)),
                                                              ),
                                                              value: item,
                                                            ))
                                                        .toList(),
                                                    onChanged: (value) =>
                                                        setState(() {
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
                          Visibility(
                            child: Container(
                              child: SfCircularChart(
                                title: ChartTitle(
                                  text:
                                      'Estatísticas da Musicoterapia \n Conforme uso por emoção sentida \n\n\n Total de Musicoterapia realizadas: $contMusic',
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                                legend: Legend(
                                    isVisible: true,
                                    overflowMode: LegendItemOverflowMode.wrap,
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                    alignment: ChartAlignment.center,
                                    itemPadding: 20,
                                    position: LegendPosition.right),
                                tooltipBehavior: _tooltipBehavior,
                                series: <CircularSeries>[
                                  DoughnutSeries<GDPDatamusic, dynamic>(
                                      dataSource: _chartDatamusic,
                                      xValueMapper: (GDPDatamusic data, _) =>
                                          data.emoteBaseM,
                                      yValueMapper: (GDPDatamusic data, _) =>
                                          data.contMusic,
                                      pointColorMapper:
                                          (GDPDatamusic data, _) =>
                                              data.colorgraf,
                                      dataLabelSettings:
                                          DataLabelSettings(isVisible: true),
                                      enableTooltip: true),
                                ],
                              ),
                            ),
                            visible: value.contains("Geral") ? true : false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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

  readFirebase() async {
    var tec = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('EmotionStats')
        .get();
    DateTime today = DateTime.now();
    DateTime twoweeks = today.subtract(const Duration(days: 15));
    DateTime monthAgo = today.subtract(const Duration(days: 30));

    //Medit ----------------------------
    //Medit GroupBy
    List<dynamic> listMedit = (tec.data()?['Meditacao']);
    var listMedit2 = listMedit.map((e) => EmotionStats.fromJson(e)).toList();
    var listMeditOver = listMedit2.groupBy((m) => m.emotion);

    contMeditansi = listMeditOver['ansiedade']?.length ?? 0;
    contMeditmed = listMeditOver['medo']?.length ?? 0;
    contMeditraiva = listMeditOver['raiva']?.length ?? 0;
    contMeditstress = listMeditOver['stress']?.length ?? 0;
    contMedittriste = listMeditOver['triste']?.length ?? 0;

    //Medit 15 dias
    var quinze = listMedit2
        .where((element) =>
            element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
        .toList();
    var quinzeListMedit = quinze.groupBy((m) => m.emotion);

    quinzeMeditansi = quinzeListMedit['ansiedade']?.length ?? 0;
    quinzeMeditmed = quinzeListMedit['medo']?.length ?? 0;
    quinzeMeditraiva = quinzeListMedit['raiva']?.length ?? 0;
    quinzeMeditstress = quinzeListMedit['stress']?.length ?? 0;
    quinzeMedittriste = quinzeListMedit['triste']?.length ?? 0;

    //Medit mes
    var mes = listMedit2
        .where((element) =>
            element.date.compareTo(Timestamp.fromDate(monthAgo)) >= 0)
        .toList();
    var mesListMedit = mes.groupBy((m) => m.emotion);

    mesMeditansi = mesListMedit['ansiedade']?.length ?? 0;
    mesMeditmed = mesListMedit['medo']?.length ?? 0;
    mesMeditraiva = mesListMedit['raiva']?.length ?? 0;
    mesMeditstress = mesListMedit['stress']?.length ?? 0;
    mesMedittriste = mesListMedit['triste']?.length ?? 0;

    //Cromo ----------------------------
    //Cromo GroupBy
    List<dynamic> listCromo = (tec.data()?['Cromoterapia']);
    var listCromo2 = listCromo.map((e) => EmotionStats.fromJson(e)).toList();
    var listCromoOver = listCromo2.groupBy((m) => m.emotion);

    contCromoansi = listCromoOver['ansiedade']?.length ?? 0;
    contCromomed = listCromoOver['medo']?.length ?? 0;
    contCromoraiva = listCromoOver['raiva']?.length ?? 0;
    contCromostress = listCromoOver['stress']?.length ?? 0;
    contCromotriste = listCromoOver['triste']?.length ?? 0;

    //Cromo 15 dias
    var quinzeCromo = listMedit2
        .where((element) =>
            element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
        .toList();
    var quinzeListCromo = quinzeCromo.groupBy((m) => m.emotion);

    quinzeCromoansi = quinzeListCromo['ansiedade']?.length ?? 0;
    quinzeCromomed = quinzeListCromo['medo']?.length ?? 0;
    quinzeCromoraiva = quinzeListCromo['raiva']?.length ?? 0;
    quinzeCromostress = quinzeListCromo['stress']?.length ?? 0;
    quinzeCromotriste = quinzeListCromo['triste']?.length ?? 0;

    //Cromo mes
    var mesCromo = listMedit2
        .where((element) =>
            element.date.compareTo(Timestamp.fromDate(monthAgo)) >= 0)
        .toList();
    var mesListCromo = mesCromo.groupBy((m) => m.emotion);

    mesCromoansi = mesListCromo['ansiedade']?.length ?? 0;
    mesCromomed = mesListCromo['medo']?.length ?? 0;
    mesCromoraiva = mesListCromo['raiva']?.length ?? 0;
    mesCromostress = mesListCromo['stress']?.length ?? 0;
    mesCromotriste = mesListCromo['triste']?.length ?? 0;

    //Music ----------------------------
    //Music GroupBy
    List<dynamic> listMusic = (tec.data()?['Musicoterapia']);
    var listMusic2 = listMusic.map((e) => EmotionStats.fromJson(e)).toList();
    var listMusicOver = listMusic2.groupBy((m) => m.emotion);

    contMusicansi = listMusicOver['ansiedade']?.length ?? 0;
    contMusicmed = listMusicOver['medo']?.length ?? 0;
    contMusicraiva = listMusicOver['raiva']?.length ?? 0;
    contMusicstress = listMusicOver['stress']?.length ?? 0;
    contMusictriste = listMusicOver['triste']?.length ?? 0;
    //Music 15 dias
    var quinzeMusic = listMusic2
        .where((element) =>
            element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
        .toList();
    var quinzeListMusic = quinzeMusic.groupBy((m) => m.emotion);

    quinzeMusicansi = quinzeListMusic['ansiedade']?.length ?? 0;
    quinzeMusicmed = quinzeListMusic['medo']?.length ?? 0;
    quinzeMusicraiva = quinzeListMusic['raiva']?.length ?? 0;
    quinzeMusicstress = quinzeListMusic['stress']?.length ?? 0;
    quinzeMusictriste = quinzeListMusic['triste']?.length ?? 0;

    //Music 15 dias
    var mesMusic = listMusic2
        .where((element) =>
            element.date.compareTo(Timestamp.fromDate(monthAgo)) >= 0)
        .toList();
    var mesListMusic = mesMusic.groupBy((m) => m.emotion);

    mesMusicansi = mesListMusic['ansiedade']?.length ?? 0;
    mesMusicmed = mesListMusic['medo']?.length ?? 0;
    mesMusicraiva = mesListMusic['raiva']?.length ?? 0;
    mesMusicstress = mesListMusic['stress']?.length ?? 0;
    mesMusictriste = mesListMusic['triste']?.length ?? 0;

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
