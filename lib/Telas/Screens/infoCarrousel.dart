import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapad_v3/Telas/components/appbar_default.dart';

class InfoCarrousel extends StatefulWidget {
  final bool? item1;
  final bool? item2;
  final bool? item3;
  final bool? item4;

  const InfoCarrousel(
      {Key? key, this.item1, this.item2, this.item3, this.item4})
      : super(key: key);

  @override
  _InfoCarrouselState createState() => _InfoCarrouselState();
}

class _InfoCarrouselState extends State<InfoCarrousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarDefault(title: "Informações"),
        backgroundColor: Colors.black87,
        body: config());
  }

  config() {
    if (widget.item1 == true) {
      return ItemClass1();
    } else if (widget.item2 == true) {
      return ItemClass2();
    } else if (widget.item3 == true) {
      return ItemClass3();
    } else if (widget.item4 == true) {
      return ItemClass4();
    }
  }
}

class ItemClass1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
      children: [
        Card(
          color: Colors.black54,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Cromoterapia e seu objetivo",
              style: GoogleFonts.lora(
                  textStyle: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              )),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 10),
        Card(
            color: Colors.black54,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "A cromoterapia é um tipo de tratamento complementar que utiliza ondas emitidas pelas cores como o amarelo, vermelho, azul, verde ou laranja, atuando em células do corpo e melhorando o equilíbrio entre o corpo e a mente, sendo que cada cor apresenta uma função terapêutica diferente.",
                style: GoogleFonts.lora(
                    textStyle: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                )),
                textAlign: TextAlign.center,
              ),
            )),
      ],
    );
  }
}

class ItemClass2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
      children: [
        Card(
          color: Colors.black54,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Como a música age no cérebro",
              style: GoogleFonts.lora(
                  textStyle: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              )),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 10),
        Card(
            color: Colors.black54,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Um estudo publicado em 2014 analisou como o cérebro funciona quando sob influência de música. Nesse estudo, os pesquisadores colocaram músicos de jazz para tocar seus instrumentos enquanto faziam uma ressonância magnética do cérebro. Essa prática serviu para averiguar quais partes do cérebro se acendiam quando os músicos estavam tocando. Além de se constatar que todas aquelas regiões foram de fato ativadas, os pesquisadores pediram que os músicos improvisassem em conjunto. Isso possibilitou a constatação de que o cérebro, quando estamos improvisando uma música em conjunto, funciona de uma maneira muito similar a quando estamos conversando oralmente com outra pessoa. Essa descoberta serve de respaldo para musicoterapia e seus benefícios para processos comunicativos, visto que as mesmas áreas de comunicação se acendem tanto quando estamos conversando como quando estamos tocando algum instrumento com outra pessoa. Além disso, a música ativa diversas regiões do cérebro responsáveis pela memória, como o hipocampo. Isso faz com que ela possa ser utilizada de forma terapêutica em pacientes que sofrem com doenças neurodegenerativas, como o Alzheimer.",
                style: GoogleFonts.lora(
                    textStyle: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                )),
                textAlign: TextAlign.center,
              ),
            )),
      ],
    );
  }
}

class ItemClass3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
      children: [
        Card(
          color: Colors.black54,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Por que devo respirar conscientemente",
              style: GoogleFonts.lora(
                  textStyle: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              )),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 10),
        Card(
            color: Colors.black54,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Respirar de forma consciente diminui ansiedade e aumenta tempo de vida. Apesar de o ato de respirar poder ser controlado, no dia a dia estamos treinados para colocar atenção no que estamos fazendo e deixar o corpo assumir o controle de inspirar e expirar",
                style: GoogleFonts.lora(
                    textStyle: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                )),
                textAlign: TextAlign.center,
              ),
            )),
      ],
    );
  }
}

class ItemClass4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
      children: [
        Card(
          color: Colors.black54,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Para meditar eu preciso não pensar em nada?",
              style: GoogleFonts.lora(
                  textStyle: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              )),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 10),
        Card(
            color: Colors.black54,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Acontece que não pensar em nada é muito difícil. A natureza da mente é pensar, ela está o tempo inteiro trabalhando, só que como estamos fazendo outras coisas, nós estamos lidando com ela em outro nível, em um ritmo acelerado. Aí, sentamos, queremos voltar para o nosso interior e a mente simplesmente não para! Isso acontece porque não estamos acostumados, é como frear um trem em alta velocidade. Esse trem não pode ser freado com tudo, isso não dá certo, pois ele precisa ser freado aos poucos. ",
                style: GoogleFonts.lora(
                    textStyle: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                )),
                textAlign: TextAlign.center,
              ),
            )),
      ],
    );
  }
}
