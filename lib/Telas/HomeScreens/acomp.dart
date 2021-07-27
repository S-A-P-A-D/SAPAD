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
  late List<GDPDatamedit15> _chartDatamedit15 = [];
  late List<GDPDatacromo15> _chartDatacromo15 = [];
  late List<GDPDatamusic15> _chartDatamusic15 = [];
  late List<GDPDatamedit30> _chartDatamedit30 = [];
  late List<GDPDatacromo30> _chartDatacromo30 = [];
  late List<GDPDatamusic30> _chartDatamusic30 = [];
  late TooltipBehavior _tooltipBehavior;

  //Medit --------------------------------
  bool? _meditNull = false;
  late int _meditOver = 0;
  late int contMedit = 0;
  late int contMeditmed = 0;
  late int contMeditansi = 0;
  late int contMeditraiva = 0;
  late int contMeditstress = 0;
  late int contMedittriste = 0;

  late int _meditquinze = 0;
  late int quinzecontMedit;
  late int quinzeMeditansi = 0;
  late int quinzeMeditmed = 0;
  late int quinzeMeditraiva = 0;
  late int quinzeMeditstress = 0;
  late int quinzeMedittriste = 0;

  late int _meditmes = 0;
  late int mescontMedit = 0;
  late int mesMeditansi = 0;
  late int mesMeditmed = 0;
  late int mesMeditraiva = 0;
  late int mesMeditstress = 0;
  late int mesMedittriste = 0;

  //Cromo --------------------------------
  bool? _cromoNull = false;
  late int _cromoOver = 0;
  late int contCromo = 0;
  late int contCromomed = 0;
  late int contCromoansi = 0;
  late int contCromoraiva = 0;
  late int contCromostress = 0;
  late int contCromotriste = 0;

  late int _cromoquinze = 0;
  late int quinzecontCromo = 0;
  late int quinzeCromoansi = 0;
  late int quinzeCromomed = 0;
  late int quinzeCromoraiva = 0;
  late int quinzeCromostress = 0;
  late int quinzeCromotriste = 0;

  late int _cromomes = 0;
  late int mescontCromo = 0;
  late int mesCromoansi = 0;
  late int mesCromomed = 0;
  late int mesCromoraiva = 0;
  late int mesCromostress = 0;
  late int mesCromotriste = 0;

  //Music --------------------------------
  bool? _musicNull = false;
  late int _musicOver = 0;
  late int contMusic = 0;
  late int contMusicmed = 0;
  late int contMusicansi = 0;
  late int contMusicraiva = 0;
  late int contMusicstress = 0;
  late int contMusictriste = 0;

  late int _musicquinze = 0;
  late int quinzecontMusic = 0;
  late int quinzeMusicansi = 0;
  late int quinzeMusicmed = 0;
  late int quinzeMusicraiva = 0;
  late int quinzeMusicstress = 0;
  late int quinzeMusictriste = 0;

  // ignore: unused_field
  late int _musicmes = 0;
  late int mescontMusic = 0;
  late int mesMusicansi = 0;
  late int mesMusicmed = 0;
  late int mesMusicraiva = 0;
  late int mesMusicstress = 0;
  late int mesMusictriste = 0;
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
  static final List<String> itemsFiltro = <String>[
    '15 dias',
    '30 dias',
    'Geral'
  ];
  late String valueFiltro = itemsFiltro.first;

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
            Column(
              children: [
                Card(
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
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            decoration: InputDecoration(
                              labelText: "Insira o E-mail de seu paciente:",
                              labelStyle: GoogleFonts.lora(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: myController,
                          ),
                        ],
                      )),
                ),
              ],
            ),

            //Dropdown Button
            SizedBox(height: 2),
            Visibility(
              child: Padding(
                  padding: EdgeInsets.all(2.0),
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
                                                          color: Colors.white)),
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
              visible: emailParceiro.isNotEmpty ? true : false,
            ),

            SizedBox(height: 5),
            //Filtro
            Visibility(
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
                          color: Colors.black,
                        ),
                        child: DropdownButton<String>(
                          focusColor: Colors.black,
                          dropdownColor: Colors.black,
                          underline: Container(
                            color: Colors.red,
                            height: 1,
                          ),
                          value: valueFiltro,
                          items: itemsFiltro
                              .map((itemFiltro) => DropdownMenuItem<String>(
                                    child: Text(
                                      itemFiltro,
                                      style: GoogleFonts.lora(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.red)),
                                    ),
                                    value: itemFiltro,
                                  ))
                              .toList(),
                          onChanged: (valueFiltro) => setState(() {
                            this.valueFiltro = valueFiltro!;
                          }),
                        ),
                      ),
                    ],
                  )),
              visible: emailParceiro.isEmpty ? false : true,
            ),

            //Grafico Meditação
            Visibility(
              child: SfCircularChart(
                title: ChartTitle(
                  text:
                      'Estatísticas da Meditação \n Conforme uso por emoção sentida \n\n Total de Meditações realizadas: $_meditOver',
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
              visible: value.contains("Meditação") &&
                      emailParceiro.isNotEmpty &&
                      valueFiltro.contains("Geral")
                  ? true
                  : false,
            ),

            //Gráfico Meditação 15 dias
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Meditação \n Conforme uso por emoção sentida \n\n\n Total de Meditações realizadas nos ultimos 15 dias: $_meditquinze',
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  legend: Legend(
                      title: LegendTitle(
                        text: 'Emoções',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                      textStyle: TextStyle(color: Colors.white, fontSize: 10),
                      alignment: ChartAlignment.center,
                      itemPadding: 20,
                      position: LegendPosition.right),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    DoughnutSeries<GDPDatamedit15, dynamic>(
                        dataSource: _chartDatamedit15,
                        xValueMapper: (GDPDatamedit15 data, _) =>
                            data.emoteBase,
                        yValueMapper: (GDPDatamedit15 data, _) =>
                            data.quinzecontMedit,
                        pointColorMapper: (GDPDatamedit15 data, _) =>
                            data.colorgraf,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true),
                  ],
                ),
              ),
              visible: value.contains("Meditação") &&
                      emailParceiro.isNotEmpty &&
                      valueFiltro.contains("15")
                  ? true
                  : false,
            ),

            //Gráfico Meditação 30 dias
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Meditação \n Conforme uso por emoção sentida \n\n\n Total de Meditações realizadas nos ultimos 30 dias: $_meditmes',
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  legend: Legend(
                      title: LegendTitle(
                        text: 'Emoções',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                      textStyle: TextStyle(color: Colors.white, fontSize: 10),
                      alignment: ChartAlignment.center,
                      itemPadding: 20,
                      position: LegendPosition.right),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    DoughnutSeries<GDPDatamedit30, dynamic>(
                        dataSource: _chartDatamedit30,
                        xValueMapper: (GDPDatamedit30 data, _) =>
                            data.emoteBase,
                        yValueMapper: (GDPDatamedit30 data, _) =>
                            data.mescontMedit,
                        pointColorMapper: (GDPDatamedit30 data, _) =>
                            data.colorgraf,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true),
                  ],
                ),
              ),
              visible: value.contains("Meditação") &&
                      emailParceiro.isNotEmpty &&
                      valueFiltro.contains("30")
                  ? true
                  : false,
            ),

            //Grafico Cromoterapia
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Cromaterapia \n Conforme uso por emoção sentida \n\n\n Total de Cromaterapias realizadas: $_cromoOver',
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
              visible: value.contains("Cromoterapia") &&
                      emailParceiro.isNotEmpty &&
                      valueFiltro.contains("Geral")
                  ? true
                  : false,
            ),

            //Grafico Cromoterapia 15 dias
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Cromaterapia \n Conforme uso por emoção sentida \n\n\n Total de Cromaterapias realizadas nos ultimos 15 dias: $_cromoquinze',
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
                    DoughnutSeries<GDPDatacromo15, dynamic>(
                        dataSource: _chartDatacromo15,
                        xValueMapper: (GDPDatacromo15 data, _) =>
                            data.emoteBaseC,
                        yValueMapper: (GDPDatacromo15 data, _) =>
                            data.quinzecontCromo,
                        pointColorMapper: (GDPDatacromo15 data, _) =>
                            data.colorgraf,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true),
                  ],
                ),
              ),
              visible: value.contains("Cromoterapia") &&
                      emailParceiro.isNotEmpty &&
                      valueFiltro.contains("15")
                  ? true
                  : false,
            ),

            //Grafico Cromoterapia 30 dias
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Cromaterapia \n Conforme uso por emoção sentida \n\n\n Total de Cromaterapias realizadas nos ultimos 30 dias: $_cromomes',
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
                    DoughnutSeries<GDPDatacromo30, dynamic>(
                        dataSource: _chartDatacromo30,
                        xValueMapper: (GDPDatacromo30 data, _) =>
                            data.emoteBaseC,
                        yValueMapper: (GDPDatacromo30 data, _) =>
                            data.mescontCromo,
                        pointColorMapper: (GDPDatacromo30 data, _) =>
                            data.colorgraf,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true),
                  ],
                ),
              ),
              visible: value.contains("Cromoterapia") &&
                      emailParceiro.isNotEmpty &&
                      valueFiltro.contains("30")
                  ? true
                  : false,
            ),

            //Grafico Musicoterapia
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Musicoterapia \n Conforme uso por emoção sentida \n\n\n Total de Musicoterapia realizadas: $_musicOver',
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
              visible: value.contains("Musicoterapia") &&
                      emailParceiro.isNotEmpty &&
                      valueFiltro.contains("Geral")
                  ? true
                  : false,
            ),

            //Grafico Musicoterapia 15 dias
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Musicoterapia \n Conforme uso por emoção sentida \n\n\n Total de Musicoterapia realizadas nos ultimos 15 dias: $_musicquinze',
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
                    DoughnutSeries<GDPDatamusic15, dynamic>(
                        dataSource: _chartDatamusic15,
                        xValueMapper: (GDPDatamusic15 data, _) =>
                            data.emoteBaseM,
                        yValueMapper: (GDPDatamusic15 data, _) =>
                            data.quinzecontMusic,
                        pointColorMapper: (GDPDatamusic15 data, _) =>
                            data.colorgraf,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true),
                  ],
                ),
              ),
              visible: value.contains("Musicoterapia") &&
                      emailParceiro.isNotEmpty &&
                      valueFiltro.contains("15")
                  ? true
                  : false,
            ),

            //Graffico Musicoterapia 30 dias
            Visibility(
              child: Container(
                child: SfCircularChart(
                  title: ChartTitle(
                    text:
                        'Estatísticas da Musicoterapia \n Conforme uso por emoção sentida \n\n\n Total de Musicoterapia realizadas nos últimos 30 dias: $_musicmes',
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
                    DoughnutSeries<GDPDatamusic30, dynamic>(
                        dataSource: _chartDatamusic30,
                        xValueMapper: (GDPDatamusic30 data, _) =>
                            data.emoteBaseM,
                        yValueMapper: (GDPDatamusic30 data, _) =>
                            data.mescontMusic,
                        pointColorMapper: (GDPDatamusic30 data, _) =>
                            data.colorgraf,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true),
                  ],
                ),
              ),
              visible: value.contains("Musicoterapia") &&
                      emailParceiro.isNotEmpty &&
                      valueFiltro.contains("30")
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

  //Montagem do Gráfico de meditação
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

  //Montagem do Gráfico de meditação 15 dias
  List<GDPDatamedit15> getChartDatamedit15() {
    final List<GDPDatamedit15> chartData = [];
    this.emotea.forEach((emoteBase) => {
          if (emoteBase == 'Medo')
            {
              quinzecontMedit = quinzeMeditmed,
              chartData.add(new GDPDatamedit15(
                  'Medo', quinzecontMedit, Color(0xff3366cc))),
            }
          else if (emoteBase == 'Raiva')
            {
              quinzecontMedit = quinzeMeditraiva,
              chartData.add(new GDPDatamedit15(
                  'Raiva', quinzecontMedit, Color(0xFFF06292))),
            }
          else if (emoteBase == 'Ansiedade')
            {
              quinzecontMedit = quinzeMeditansi,
              chartData.add(new GDPDatamedit15(
                  'Ansiedade', quinzecontMedit, Color(0xFF512DA8))),
            }
          else if (emoteBase == 'Triste')
            {
              quinzecontMedit = quinzeMedittriste,
              chartData.add(new GDPDatamedit15(
                  'Triste', quinzecontMedit, Color(0xffEF9A9A))),
            }
          else if (emoteBase == 'Estresse')
            {
              quinzecontMedit = quinzeMeditstress,
              chartData.add(new GDPDatamedit15(
                  'Estresse', quinzecontMedit, Color(0xffff9900))),
            }
        });
    return chartData;
  }

  //Montagem do Gráfico de meditação 30 dias
  List<GDPDatamedit30> getChartDatamedit30() {
    final List<GDPDatamedit30> chartData = [];
    this.emotea.forEach((emoteBase) => {
          if (emoteBase == 'Medo')
            {
              mescontMedit = mesMeditmed,
              chartData.add(
                  new GDPDatamedit30('Medo', mescontMedit, Color(0xff3366cc))),
            }
          else if (emoteBase == 'Raiva')
            {
              mescontMedit = mesMeditraiva,
              chartData.add(
                  new GDPDatamedit30('Raiva', mescontMedit, Color(0xFFF06292))),
            }
          else if (emoteBase == 'Ansiedade')
            {
              mescontMedit = mesMeditansi,
              chartData.add(new GDPDatamedit30(
                  'Ansiedade', mescontMedit, Color(0xFF512DA8))),
            }
          else if (emoteBase == 'Triste')
            {
              mescontMedit = mesMedittriste,
              chartData.add(new GDPDatamedit30(
                  'Triste', mescontMedit, Color(0xffEF9A9A))),
            }
          else if (emoteBase == 'Estresse')
            {
              mescontMedit = mesMeditstress,
              chartData.add(new GDPDatamedit30(
                  'Estresse', mescontMedit, Color(0xffff9900))),
            }
        });
    return chartData;
  }

  //Montagem do Grafico de Cromotarapia
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

  //Montagem do Gráfico de cromoterapia 15 dias
  List<GDPDatacromo15> getChartDatacromo15() {
    final List<GDPDatacromo15> chartData = [];
    this.emotea.forEach((emoteBaseC) => {
          if (emoteBaseC == 'Medo')
            {
              contCromo = quinzeCromomed,
              chartData.add(
                  new GDPDatacromo15('Medo', contCromo, Color(0xff3366cc))),
            }
          else if (emoteBaseC == 'Raiva')
            {
              contCromo = quinzeCromoraiva,
              chartData.add(
                  new GDPDatacromo15('Raiva', contCromo, Color(0xFFF06292))),
            }
          else if (emoteBaseC == 'Ansiedade')
            {
              contCromo = quinzeCromoansi,
              chartData.add(new GDPDatacromo15(
                  'Ansiedade', contCromo, Color(0xFF512DA8))),
            }
          else if (emoteBaseC == 'Triste')
            {
              contCromo = quinzeCromotriste,
              chartData.add(
                  new GDPDatacromo15('Triste', contCromo, Color(0xffEF9A9A))),
            }
          else if (emoteBaseC == 'Estresse')
            {
              contCromo = quinzeCromostress,
              chartData.add(
                  new GDPDatacromo15('Estresse', contCromo, Color(0xffff9900))),
            }
        });
    return chartData;
  }

  //Montagem do Gráfico de cromoterapia 30 dias
  List<GDPDatacromo30> getChartDatacromo30() {
    final List<GDPDatacromo30> chartData = [];
    this.emotea.forEach((emoteBaseC) => {
          if (emoteBaseC == 'Medo')
            {
              contCromo = mesCromomed,
              chartData.add(
                  new GDPDatacromo30('Medo', contCromo, Color(0xff3366cc))),
            }
          else if (emoteBaseC == 'Raiva')
            {
              contCromo = mesCromoraiva,
              chartData.add(
                  new GDPDatacromo30('Raiva', contCromo, Color(0xFFF06292))),
            }
          else if (emoteBaseC == 'Ansiedade')
            {
              contCromo = mesCromoansi,
              chartData.add(new GDPDatacromo30(
                  'Ansiedade', contCromo, Color(0xFF512DA8))),
            }
          else if (emoteBaseC == 'Triste')
            {
              contCromo = mesCromotriste,
              chartData.add(
                  new GDPDatacromo30('Triste', contCromo, Color(0xffEF9A9A))),
            }
          else if (emoteBaseC == 'Estresse')
            {
              contCromo = mesCromostress,
              chartData.add(
                  new GDPDatacromo30('Estresse', contCromo, Color(0xffff9900))),
            }
        });
    return chartData;
  }

  //Montagem do Grafico de Musicoterapia
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

  //Montagem do gráfico de musicoterapia 15 dias
  List<GDPDatamusic15> getChartDatamusic15() {
    final List<GDPDatamusic15> chartData = [];
    this.emotea.forEach((emoteBaseM) => {
          if (emoteBaseM == 'Medo')
            {
              contMusic = quinzeMusicmed,
              chartData.add(
                  new GDPDatamusic15('Medo', contMusic, Color(0xff3366cc))),
            }
          else if (emoteBaseM == 'Raiva')
            {
              contMusic = quinzeMusicraiva,
              chartData.add(
                  new GDPDatamusic15('Raiva', contMusic, Color(0xFFF06292))),
            }
          else if (emoteBaseM == 'Ansiedade')
            {
              contMusic = quinzeMusicansi,
              chartData.add(new GDPDatamusic15(
                  'Ansiedade', contMusic, Color(0xFF512DA8))),
            }
          else if (emoteBaseM == 'Triste')
            {
              contMusic = quinzeMusictriste,
              chartData.add(
                  new GDPDatamusic15('Triste', contMusic, Color(0xffEF9A9A))),
            }
          else if (emoteBaseM == 'Estresse')
            {
              contMusic = quinzeMusicstress,
              chartData.add(
                  new GDPDatamusic15('Estresse', contMusic, Color(0xffff9900))),
            }
        });
    return chartData;
  }

  //Montagem do gráfico de musicoterapia 30 dias
  List<GDPDatamusic30> getChartDatamusic30() {
    final List<GDPDatamusic30> chartData = [];
    this.emotea.forEach((emoteBaseM) => {
          if (emoteBaseM == 'Medo')
            {
              contMusic = mesMusicmed,
              chartData.add(
                  new GDPDatamusic30('Medo', contMusic, Color(0xff3366cc))),
            }
          else if (emoteBaseM == 'Raiva')
            {
              contMusic = mesMusicraiva,
              chartData.add(
                  new GDPDatamusic30('Raiva', contMusic, Color(0xFFF06292))),
            }
          else if (emoteBaseM == 'Ansiedade')
            {
              contMusic = mesMusicansi,
              chartData.add(new GDPDatamusic30(
                  'Ansiedade', contMusic, Color(0xFF512DA8))),
            }
          else if (emoteBaseM == 'Triste')
            {
              contMusic = mesMusictriste,
              chartData.add(
                  new GDPDatamusic30('Triste', contMusic, Color(0xffEF9A9A))),
            }
          else if (emoteBaseM == 'Estresse')
            {
              contMusic = mesMusicstress,
              chartData.add(
                  new GDPDatamusic30('Estresse', contMusic, Color(0xffff9900))),
            }
        });
    return chartData;
  }

  readFirebase() async {
    var tec = await FirebaseFirestore.instance
        .collection(emailParceiro)
        .doc('EmotionStats')
        .get();
    DateTime today = DateTime.now();
    DateTime twoweeks = today.subtract(const Duration(days: 15));
    DateTime monthAgo = today.subtract(const Duration(days: 30));

    try {
      //Medit ----------------------------
      //Medit GroupBy
      List<dynamic> listMedit = (tec.data()?['Meditacao']);
      var listMedit2 = listMedit.map((e) => EmotionStats.fromJson(e)).toList();
      var listMeditOver = listMedit2.groupBy((m) => m.emotion);

      //Cont
      List<dynamic> listMeditCont = (tec.data()?['Geral']);
      var listMeditCont2 =
          listMeditCont.map((e) => EmotionStats.fromJson(e)).toList();
      var listMeditOverCont = listMeditCont2.groupBy((m) => m.emotion);

      _meditOver = listMeditOverCont['meditacao']?.length ?? 0;
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
      //Cont
      var quinzeCont = listMeditCont2
          .where((element) =>
              element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
          .toList();
      var meditContQuinze = quinzeCont.groupBy((m) => m.emotion);

      _meditquinze = meditContQuinze['meditacao']?.length ?? 0;
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
      //Cont
      var mesCont = listMeditCont2
          .where((element) =>
              element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
          .toList();
      var meditContMes = mesCont.groupBy((m) => m.emotion);

      _meditmes = meditContMes['meditacao']?.length ?? 0;
      mesMeditansi = mesListMedit['ansiedade']?.length ?? 0;
      mesMeditmed = mesListMedit['medo']?.length ?? 0;
      mesMeditraiva = mesListMedit['raiva']?.length ?? 0;
      mesMeditstress = mesListMedit['stress']?.length ?? 0;
      mesMedittriste = mesListMedit['triste']?.length ?? 0;
    } catch (e) {
      setState(() {
        _meditNull = true;
      });
      print(e);
    }

    try {
      //Cromo ----------------------------
      //Cromo GroupBy
      List<dynamic> listCromo = (tec.data()?['Cromoterapia']);
      var listCromo2 = listCromo.map((e) => EmotionStats.fromJson(e)).toList();
      var listCromoOver = listCromo2.groupBy((m) => m.emotion);

      List<dynamic> listCromoCont = (tec.data()?['Geral']);
      var listCromoCont2 =
          listCromoCont.map((e) => EmotionStats.fromJson(e)).toList();
      var listCromoOverCont = listCromoCont2.groupBy((m) => m.emotion);

      _cromoOver = listCromoOverCont['cromoterapia']?.length ?? 0;
      contCromoansi = listCromoOver['ansiedade']?.length ?? 0;
      contCromomed = listCromoOver['medo']?.length ?? 0;
      contCromoraiva = listCromoOver['raiva']?.length ?? 0;
      contCromostress = listCromoOver['stress']?.length ?? 0;
      contCromotriste = listCromoOver['triste']?.length ?? 0;

      //Cromo 15 dias
      var quinzeCromo = listCromo2
          .where((element) =>
              element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
          .toList();
      var quinzeListCromo = quinzeCromo.groupBy((m) => m.emotion);

      var quinzeContCromo = listCromoCont2
          .where((element) =>
              element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
          .toList();
      var cromoContQuinze = quinzeContCromo.groupBy((m) => m.emotion);

      _cromoquinze = cromoContQuinze['cromoterapia']?.length ?? 0;
      quinzeCromoansi = quinzeListCromo['ansiedade']?.length ?? 0;
      quinzeCromomed = quinzeListCromo['medo']?.length ?? 0;
      quinzeCromoraiva = quinzeListCromo['raiva']?.length ?? 0;
      quinzeCromostress = quinzeListCromo['stress']?.length ?? 0;
      quinzeCromotriste = quinzeListCromo['triste']?.length ?? 0;

      //Cromo mes
      var mesCromo = listCromo2
          .where((element) =>
              element.date.compareTo(Timestamp.fromDate(monthAgo)) >= 0)
          .toList();
      var mesListCromo = mesCromo.groupBy((m) => m.emotion);

      var mesContCromo = listCromoCont2
          .where((element) =>
              element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
          .toList();
      var cromoContMes = mesContCromo.groupBy((m) => m.emotion);

      _cromomes = cromoContMes['meditacao']?.length ?? 0;
      mesCromoansi = mesListCromo['ansiedade']?.length ?? 0;
      mesCromomed = mesListCromo['medo']?.length ?? 0;
      mesCromoraiva = mesListCromo['raiva']?.length ?? 0;
      mesCromostress = mesListCromo['stress']?.length ?? 0;
      mesCromotriste = mesListCromo['triste']?.length ?? 0;
    } catch (e) {
      setState(() {
        _cromoNull = true;
      });
      print(e);
    }

    try {
      //Music ----------------------------
      //Music GroupBy
      List<dynamic> listMusic = (tec.data()?['Musicoterapia']);
      var listMusic2 = listMusic.map((e) => EmotionStats.fromJson(e)).toList();
      var listMusicOver = listMusic2.groupBy((m) => m.emotion);

      List<dynamic> listMusicCont = (tec.data()?['Geral']);
      var listMusicCont2 =
          listMusicCont.map((e) => EmotionStats.fromJson(e)).toList();
      var listMusicOverCont = listMusicCont2.groupBy((m) => m.emotion);

      _musicOver = listMusicOverCont['musicoterapia']?.length ?? 0;
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

      var quinzeContMusic = listMusicCont2
          .where((element) =>
              element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
          .toList();
      var musicContQuinze = quinzeContMusic.groupBy((m) => m.emotion);

      _musicquinze = musicContQuinze['musicoterapia']?.length ?? 0;
      quinzeMusicansi = quinzeListMusic['ansiedade']?.length ?? 0;
      quinzeMusicmed = quinzeListMusic['medo']?.length ?? 0;
      quinzeMusicraiva = quinzeListMusic['raiva']?.length ?? 0;
      quinzeMusicstress = quinzeListMusic['stress']?.length ?? 0;
      quinzeMusictriste = quinzeListMusic['triste']?.length ?? 0;

      //Music 30 dias
      var mesMusic = listMusic2
          .where((element) =>
              element.date.compareTo(Timestamp.fromDate(monthAgo)) >= 0)
          .toList();
      var mesListMusic = mesMusic.groupBy((m) => m.emotion);
      var mesContMusic = listMusicCont2
          .where((element) =>
              element.date.compareTo(Timestamp.fromDate(twoweeks)) >= 0)
          .toList();
      var musicContmes = mesContMusic.groupBy((m) => m.emotion);

      _musicmes = musicContmes['musicoterapia']?.length ?? 0;
      mesMusicansi = mesListMusic['ansiedade']?.length ?? 0;
      mesMusicmed = mesListMusic['medo']?.length ?? 0;
      mesMusicraiva = mesListMusic['raiva']?.length ?? 0;
      mesMusicstress = mesListMusic['stress']?.length ?? 0;
      mesMusictriste = mesListMusic['triste']?.length ?? 0;
    } catch (e) {
      setState(() {
        _musicNull = true;
      });
      print(e);
    }

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
    _chartDatamedit15 = getChartDatamedit15();
    _chartDatacromo15 = getChartDatacromo15();
    _chartDatamusic15 = getChartDatamusic15();
    _chartDatamedit30 = getChartDatamedit30();
    _chartDatacromo30 = getChartDatacromo30();
    _chartDatamusic30 = getChartDatamusic30();
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

class GDPDatamedit15 {
  final String emoteBase;
  final int quinzecontMedit;
  final Color colorgraf;
  GDPDatamedit15(this.emoteBase, this.quinzecontMedit, this.colorgraf);

  @override
  String toString() {
    return emoteBase + quinzecontMedit.toString();
  }
}

class GDPDatamedit30 {
  final String emoteBase;
  final int mescontMedit;
  final Color colorgraf;
  GDPDatamedit30(this.emoteBase, this.mescontMedit, this.colorgraf);

  @override
  String toString() {
    return emoteBase + mescontMedit.toString();
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

class GDPDatacromo15 {
  final String emoteBaseC;
  final int quinzecontCromo;
  final Color colorgraf;

  GDPDatacromo15(this.emoteBaseC, this.quinzecontCromo, this.colorgraf);
  @override
  String toString() {
    return emoteBaseC + quinzecontCromo.toString();
  }
}

class GDPDatacromo30 {
  final String emoteBaseC;
  final int mescontCromo;
  final Color colorgraf;

  GDPDatacromo30(this.emoteBaseC, this.mescontCromo, this.colorgraf);
  @override
  String toString() {
    return emoteBaseC + mescontCromo.toString();
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

class GDPDatamusic15 {
  final String emoteBaseM;
  final int quinzecontMusic;
  final Color colorgraf;

  GDPDatamusic15(this.emoteBaseM, this.quinzecontMusic, this.colorgraf);
  @override
  String toString() {
    return emoteBaseM + quinzecontMusic.toString();
  }
}

class GDPDatamusic30 {
  final String emoteBaseM;
  final int mescontMusic;
  final Color colorgraf;

  GDPDatamusic30(this.emoteBaseM, this.mescontMusic, this.colorgraf);
  @override
  String toString() {
    return emoteBaseM + mescontMusic.toString();
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
