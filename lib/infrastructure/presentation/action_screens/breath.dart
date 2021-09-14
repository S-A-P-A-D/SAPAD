import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sapad_v3/infrastructure/utils/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class VideoBreathPage extends StatefulWidget {
  const VideoBreathPage({Key? key}) : super(key: key);

  @override
  _VideoBreathPageState createState() => _VideoBreathPageState();
}

class _VideoBreathPageState extends State<VideoBreathPage> {
  late VideoPlayerController controller;
  final asset = 'assets/breathe.mp4';

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Respiração",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: ListView(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
          children: [
            //Card 1
            GestureDetector(
              child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(MdiIcons.cloud, size: 50, color: Colors.red),
                          Expanded(
                            child: Text("Saiba mais sobre a Respiração",
                                style: GoogleFonts.lora(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 25))),
                          )
                        ],
                      ))),
              onTap: () {
                _requestPopInfo(context);
              },
            ),
            SizedBox(height: 30),
            VideoPlayerWidget(controller: controller),
            const SizedBox(height: 32),
            if (controller.value.isInitialized)
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                  child: IconButton(
                      icon: Icon(isMuted ? Icons.volume_mute : Icons.volume_up,
                          color: Colors.white),
                      onPressed: () {
                        controller.setVolume(isMuted ? 1 : 0);
                      })),
          ],
        ),
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
                child: Text(
                  "Respirar corretamente gera inúmeros benefícios ao organismo, como por exemplo, melhorar a digestão, eliminar as toxinas que se formam no corpo, equilibrar as funções orgânicas, ajudar a fortalecer organismos debilitados e combater até mesmo a ansiedade e a obesidade. Respirar lentamente pode ajudar a acalmar e a relaxar o organismo, diminuindo a frequência dos batimentos cardíacos.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
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
}
