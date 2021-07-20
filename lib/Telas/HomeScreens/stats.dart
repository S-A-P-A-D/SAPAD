import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    readFirebase();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

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
                      Container(
                        child: SfCircularChart(
                          title: ChartTitle(
                            text:
                                'Estatísticas da Meditação \n Conforme uso por emoção sentida \n\n\n Total de Meditações realizadas: $_contMedit ',
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
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 10),
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
                      Container(
                        child: SfCircularChart(
                          title: ChartTitle(
                            text:
                                'Estatísticas da Cromaterapia \n Conforme uso por emoção sentida \n\n\n Total de Cromaterapias realizadas: $_contCromo',
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          legend: Legend(
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap,
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 10),
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
                                pointColorMapper: (GDPDatacromo data, _) =>
                                    data.colorgraf,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                enableTooltip: true),
                          ],
                        ),
                      ),
                      Container(
                        child: SfCircularChart(
                          title: ChartTitle(
                            text:
                                'Estatísticas da Musicoterapia \n Conforme uso por emoção sentida \n\n\n Total de Musicoterapia realizadas: $_contMusic',
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          legend: Legend(
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap,
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 10),
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
                                pointColorMapper: (GDPDatamusic data, _) =>
                                    data.colorgraf,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                enableTooltip: true),
                          ],
                        ),
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

//
  readFirebase() async {
    var tec = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    _contCromo = tec.data()?['contCromo'];
    _contMedit = tec.data()?['contMedit'];
    _contMusic = tec.data()?['contMusic'];
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
