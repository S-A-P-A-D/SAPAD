import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List colors = [
    Colors.cyan[700],
    Colors.red[600],
    Colors.purpleAccent[700],
    Colors.deepOrange,
    Colors.green[700],
    Color(0xffEF9A9A),
    Color(0xFFF06292),
    Color(0xff3366cc)
  ];
  Random random = new Random();

  int index = 3;

  void changeIndex() {
    if (colors[3] != random.nextInt(8)) {
      setState(() => index = random.nextInt(8));
    }
  }

  @override
  void initState() {
    changeIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "SAPAD",
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black87,
        body: ListView(
          children: [
            //Card 1

            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 100.0,
                        color: colors[index],
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          "Tendo em vista os problemas que a ansiedade, depressão e a falta de controle das emoções podem causar nas vidas das pessoas, esse projeto se justifica com a meta de contribuir para a diminuição desses contratempos. Para isso, contará com a combinação de tecnologias leves e técnicas de atenção plena, visando o desenvolvimento de estados mentais mais estáveis, facilitando o controle sobre as emoções. ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          "Saiba mais sobre MindFulness",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  const url =
                      'https://sites.google.com/view/sapad/início?authuser=0';
                  abrirUrl(url);
                },
              ),
            ),
            //Card 2

            Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/Logo.png"))),
                        ),
                        Expanded(
                          child: Text(
                            "Instituto Federal de Santa Catarina\nIFSC\nCampus Gaspar",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  _ifscPop(context);
                },
              ),
            ),
            //Card 3

            Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/TechMaker.jpg"))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 90.0, top: 10.0, bottom: 10.0),
                          child: Container(
                            child: Text(
                              "TechMaker\nBlumenau - SC",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  _techPop(context);
                },
              ),
            ),
            //Card 4

            Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          "Enviar Feedback",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  const url = 'https://tripetto.app/run/67SY85OQH2';
                  abrirUrl(url);
                },
              ),
            ),
            //Card 5

            Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          "Encontrou Algum BUG?\nNotifique-o Aqui",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  abrirGmail();
                },
              ),
            ),
          ],
        ));
  }

  _techPop(context) {
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
                      "Equipe de robotica de Blumenau - Santa Catarina - Brasil, teve total envolvimento na elaboração da ideia deste projeto, o qual foi apresentado em competições de robotica levando no ano de 2019 o premio de 1° lugar em melhor projeto do mundo",
                      style: GoogleFonts.lora(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 25)),
                      textAlign: TextAlign.center),
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

  _ifscPop(context) {
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
                      "Equipe composta por 4 alunos e 1 oriendador, do IFSC Campus Gaspar realizaram este projeto, vizando a práticidade e facilidade e benefícios que as aplicações podem ajudar no ambito psicológico",
                      style: GoogleFonts.lora(
                        textStyle: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      textAlign: TextAlign.center),
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

  abrirGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'pi.ifsc.gaspar@gmail.com',
      query: 'subject=Reportar&body=Detalhe aqui qual bug você encontrou: ',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  abrirUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
