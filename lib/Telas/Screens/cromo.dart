import 'package:flutter/material.dart';

class CromoPage extends StatelessWidget {
  final bool medo;
  final bool ansi;
  final bool triste;
  final bool stress;
  final bool raiva;

  const CromoPage(
      {Key key, this.medo, this.ansi, this.triste, this.stress, this.raiva})
      : super(key: key);

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
                      Column(
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/Cromoterapia.png"))),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Saiba sobre\n CROMOTERAPIA",
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
                    ],
                  ),
                ),
              ),
              onTap: () {
                _requestPopInfo(context);
              },
            ),
          ),
          //Card 2
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
                color: medo == true || stress == true || ansi == true
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
                _requestPopAzul(context);
              },
            ),
          ),
          //Card 3
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
                color: triste == true ? Colors.red : Colors.grey,
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
                _requestPopVer(context);
              },
            ),
          ),
          //Card 4
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
                color: medo == true ||
                        raiva == true ||
                        triste == true ||
                        ansi == true
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
                _requestPopAma(context);
              },
            ),
          ),
          //Card 5
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
                color: stress == true || raiva == true
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
                _requestPopRx(context);
              },
            ),
          ),
          //Card 6
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
                color: triste == true || ansi == true || raiva == true
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
                _requestPopVe(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  _requestPopInfo(context) {
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
                child: Text("Explicação sobre musicoterapia"),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  _requestPopAzul(context) {
    if (medo == true || stress == true || ansi == true) {
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
                  child: Image(image: AssetImage('assets/Azul.jpg')),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
    }
  }

  _requestPopVer(context) {
    if (triste == true) {
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
                  child: Image(image: AssetImage('assets/Vermelho.jpg')),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
    }
  }

  _requestPopAma(context) {
    if (medo == true || raiva == true || triste == true || ansi == true) {
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
                  child: Image(image: AssetImage('assets/Amarelo.jpg')),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
    }
  }

  _requestPopRx(context) {
    if (stress == true || raiva == true) {
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
                  child: Image(image: AssetImage('assets/roxo.jpg')),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
    }
  }

  _requestPopVe(context) {
    if (triste == true || ansi == true || raiva == true) {
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
                  child: Image(image: AssetImage('assets/Verde.jpg')),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
    }
  }
}
