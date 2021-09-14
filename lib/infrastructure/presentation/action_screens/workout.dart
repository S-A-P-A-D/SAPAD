import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sapad_v3/infrastructure/presentation/components/appbar_default.dart';
import 'package:sapad_v3/infrastructure/presentation/components/card_default_white.dart';

class WorkOut extends StatefulWidget {
  @override
  _WorkOutState createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: "Exercicios"),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
          child: Column(
            children: [
              Card(
                  color: Colors.white,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                            "Tente fazer exercicios por no minimo meia hora por dia.",
                            style: GoogleFonts.lora(
                                textStyle: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              textBaseline: TextBaseline.alphabetic,
                            )),
                            textAlign: TextAlign.center),
                        SizedBox(height: 10),
                        Text("Alguns exercicios faceis que podem ajudar muito:",
                            style: GoogleFonts.lora(
                                textStyle: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                            )),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  )),
              SizedBox(height: 35),
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 5),
                              ListTile(
                                leading: Icon(MdiIcons.walk,
                                    color: Colors.red, size: 60),
                                title: Text(
                                  "Caminhada",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                leading: Icon(MdiIcons.run,
                                    color: Colors.red, size: 60),
                                title: Text(
                                  "Corrida",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                leading: Icon(MdiIcons.humanHandsup,
                                    color: Colors.red, size: 60),
                                title: Text(
                                  "Polichinelos",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                leading: Icon(MdiIcons.armFlex,
                                    color: Colors.red, size: 60),
                                title: Text(
                                  "Flexões",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                leading: Icon(MdiIcons.seatReclineNormal,
                                    color: Colors.red, size: 60),
                                title: Text(
                                  "Abdominais",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                leading: Icon(MdiIcons.jumpRope,
                                    color: Colors.red, size: 60),
                                title: Text(
                                  "Pular Corda",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                leading: Icon(MdiIcons.transitTransfer,
                                    color: Colors.red, size: 60),
                                title: Text(
                                  "Alongamentos",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                leading: Icon(MdiIcons.debugStepOver,
                                    color: Colors.red, size: 60),
                                title: Text(
                                  "Avanço",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                leading: Icon(MdiIcons.handball,
                                    color: Colors.red, size: 60),
                                title: Text(
                                  "Esportes",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
