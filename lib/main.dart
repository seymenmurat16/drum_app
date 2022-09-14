import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: DrumPage(),
        ));
  }
}

class DrumPage extends StatelessWidget {
  DrumPage({super.key});

  final player = AudioPlayer();

  void play(String soundName) {
    player.play(AssetSource('$soundName.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  buildSoundArea('bip', Colors.red),
                  buildSoundArea('bongo', Colors.blue),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildSoundArea('clap1', Colors.white),
                  buildSoundArea('clap2', Colors.cyan),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildSoundArea('clap3', Colors.deepOrange),
                  buildSoundArea('crash', Colors.pink),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildSoundArea('how', Colors.purple),
                  buildSoundArea('woo', Colors.yellow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildSoundArea(String soundName, Color color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.all(8)),
        onPressed: () {
          play(soundName);
        },
        child: Container(color: color),
      ),
    );
  }
}
