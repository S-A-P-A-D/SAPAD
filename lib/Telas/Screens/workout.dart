import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapad_v3/Telas/components/appbar_default.dart';
import 'package:sapad_v3/Telas/components/card_default_white.dart';

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
              Text(
                "Tente fazer exercicios de no minimo meia hora.",
                style: GoogleFonts.lora(
                    textStyle: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  textBaseline: TextBaseline.alphabetic,
                )),
              ),
              SizedBox(height: 10),
              Text(
                "Beneficios dos exercicios fisicos na saude mental:",
                style: GoogleFonts.lora(
                    textStyle: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                )),
              ),
              SizedBox(height: 35),
              Stack(
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.all(10),
                    //alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              CardWhiteDefault(
                                  text:
                                      "Exercício físico regular aumenta a produção de endorfinas, responsáveis pelo bem-estar e por reduzir a percepção da dor.",
                                  image: "assets/Logo.png"),
                              SizedBox(height: 10),
                              CardWhiteDefault(
                                  text:
                                      "É comprovadamente eficaz na melhora do humor e no alívio dos sintomas de depressão, ansiedade e estresse",
                                  image: "assets/Logo.png")
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
