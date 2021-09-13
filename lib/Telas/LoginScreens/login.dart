import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/Telas/LoginScreens/google_sign_in.dart';
import 'package:sapad_v3/Telas/components/popup_default.dart';
import 'package:sapad_v3/control/control_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = FirebaseAuth.instance;
  bool? _marked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    color: Colors.black,
                    child: SpinKitRotatingCircle(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Algo deu errado'));
              } else if (snapshot.hasData) {
                return ControlPage();
              } else {
                return Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/meditFundo.png"),
                      fit: BoxFit.cover,
                    )),
                    child: SafeArea(
                      child: ListView(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 5.0, bottom: 20.0),
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.40,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: new BoxDecoration(
                                color: Colors.grey.withOpacity(0),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                SizedBox(height: 30),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      "Sistema de Ajuda a Pacientes com Ansiedade e Depressão",
                                      style: GoogleFonts.lora(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Expanded(
                                  child: Text(
                                    "S.A.P.A.D.",
                                    style: GoogleFonts.lora(
                                        textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    )),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.30),
                          Expanded(
                            child: Container(
                                alignment: Alignment.bottomCenter,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: new BoxDecoration(
                                    color: Colors.grey.withOpacity(0),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      child: Card(
                                          color: _marked == true
                                              ? Colors.white
                                              : Colors.grey,
                                          shadowColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(FontAwesomeIcons.google,
                                                    color: Colors.red),
                                                SizedBox(width: 20),
                                                Expanded(
                                                  child: Text(
                                                    "Faça login com o Google",
                                                    style: GoogleFonts.lora(
                                                        textStyle: TextStyle(
                                                      fontSize: 25.0,
                                                      color: Colors.red,
                                                    )),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                      onTap: () {
                                        if (_marked == true) {
                                          final provider =
                                              Provider.of<GoogleSignInProvider>(
                                                  context,
                                                  listen: false);
                                          provider.googleLogin();
                                        } else {
                                          defaultPopUp(
                                              context,
                                              "Você precisa aceitar os termos de uso",
                                              Colors.black87,
                                              close);
                                        }
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                            onPressed: () => defaultPopUp(
                                                context,
                                                "Este aplicativo tem como intuito apenas ajudar pessoas, não é um substituto de qualquer profissional ou tratamento \n Ao aceitar os termos de uso você garante que seus dados poderão ser compartilhados a partir de seu E-mail",
                                                Colors.black87,
                                                close),
                                            child: Text(
                                              "Você aceita os termos de usuario?",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                              textAlign: TextAlign.right,
                                            )),
                                        Expanded(
                                          child: CheckboxListTile(
                                              value: _marked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  _marked = value;
                                                  print(_marked);
                                                });
                                              }),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }));
  }

  close() {
    Navigator.pop(context);
  }
}
