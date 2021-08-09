import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sapad_v3/Telas/components/popup_default.dart';
import 'package:sapad_v3/Telas/components/popup_therapy.dart';
import 'package:sapad_v3/helper.dart/popCores.dart';

class CromoPage extends StatefulWidget {
  final bool? medo;
  final bool? ansi;
  final bool? triste;
  final bool? stress;
  final bool? raiva;
  final bool? isMarket;

  const CromoPage(
      {Key? key,
      this.medo,
      this.ansi,
      this.triste,
      this.stress,
      this.raiva,
      this.isMarket})
      : super(key: key);

  @override
  _CromoPageState createState() => _CromoPageState();
}

class _CromoPageState extends State<CromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Cromoterapia",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          //Card 1
          PopUpTherapy(
              onPressed: () => defaultPopUp(
                  context,
                  "A Cromoterapia é um tratamento que, através do uso das cores, estabelece um equilíbrio entre corpo físico, mente, espírito e emoções. Cada cor transmite uma mensagem ao nosso cérebro e corpo sutil que traz funções terapêuticas. Através da emissão das cores, junto à iluminação, esta terapia restabelece e energiza um corpo em desequilíbrio, para um corpo em harmonia. Trazendo bem-estar e qualidade de vida.",
                  Colors.black87,
                  close),
              name: "Saiba mais sobre a Cromoterapia",
              images: MdiIcons.lavaLamp),
          //Card Alerta
          Visibility(
            child: Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.info_outline,
                          size: 200.0, color: Colors.white60),
                    ),
                    Text(
                      "Para ter acesso as terapias você precisa selecionar seu estado atual na pagina principal",
                      style: TextStyle(color: Colors.white60, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            visible: widget.isMarket == true ? false : true,
          ),
          //Card Azul
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: widget.medo == true ||
                          widget.stress == true ||
                          widget.ansi == true
                      ? Colors.blue
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Azul",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  requestPopAzul(context);
                },
              ),
            ),
            visible: widget.medo == true ||
                    widget.stress == true ||
                    widget.ansi == true
                ? true
                : false,
          ),
          //Card Vermelho
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Vermelho",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  requestPopVermelho(context);
                },
              ),
            ),
            visible: widget.triste == true ? true : false,
          ),
          //Card Amarelo
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: widget.medo == true ||
                          widget.raiva == true ||
                          widget.triste == true ||
                          widget.ansi == true
                      ? Colors.yellow
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Amarelo",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  requestPopAmarelo(context);
                },
              ),
            ),
            visible: widget.medo == true ||
                    widget.raiva == true ||
                    widget.triste == true ||
                    widget.ansi == true
                ? true
                : false,
          ),
          //Card Roxo
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: widget.stress == true || widget.raiva == true
                      ? Colors.purple
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Roxo",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  requestPopRoxo(context);
                },
              ),
            ),
            visible:
                widget.stress == true || widget.raiva == true ? true : false,
          ),
          //Card Verde
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: widget.triste == true ||
                          widget.ansi == true ||
                          widget.raiva == true
                      ? Colors.green
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Verde",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  requestPopVerde(context);
                },
              ),
            ),
            visible: widget.triste == true ||
                    widget.ansi == true ||
                    widget.raiva == true
                ? true
                : false,
          ),
        ],
      ),
    );
  }

  close() {
    Navigator.pop(context);
  }
}
